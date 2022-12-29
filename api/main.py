from fastapi import FastAPI, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from pydantic import BaseModel

import firebase_admin
from firebase_admin import credentials, auth
from firebase_admin import firestore
import json, pyrebase, uvicorn

class LoginModel(BaseModel):
    email: str 
    password: str = None

class RegisterModel(BaseModel):
    email: str
    password: str
    username: str
    age: int
    sex: str
    weight: int
    height: int
class TokenModel(BaseModel):
    token : str


cred = credentials.Certificate('fitness-app-3de03-firebase-adminsdk-nyyku-75b4eb6480.json')



pb = pyrebase.initialize_app(json.load(open('firebase_config.json')))



app = FastAPI()

allow_all = ['*']
app.add_middleware(
   CORSMiddleware,
   allow_origins=allow_all,
   allow_credentials=True,
   allow_methods=allow_all,
   allow_headers=allow_all
)


@app.get("/foods")
async def food_data():
    f = open('foods.json')
    data = json.load(f)
    f.close()
    return data

@app.get("/exercises")
async def training_data():
    with open('exercises.json', encoding='utf-8') as f:
        data = json.load(f)
    return data


@app.post("/register")
async def signup(registerModel: RegisterModel ):
    try:
        firebase = firebase_admin.initialize_app(cred)
    except:
        pass

    email = registerModel.email
    password = registerModel.password
    if email is None or password is None:
       return JSONResponse(content={'message': 'Error! Missing Email or Password'}, status_code=400)
    try:
       user = auth.create_user(
           email=email,
           password=password
       )
       db = firestore.client()
       doc_ref = db.collection(u'users').document(user.uid)
       
       doc_ref.set({
            u'email': registerModel.email,
            u'username': registerModel.username,
            u"age": registerModel.age,
            u"sex": registerModel.sex,
            u"weight": registerModel.weight,
            u"height": registerModel.height,
        })
       return JSONResponse(content={'message': f'Successfully created user {user.uid}'}, status_code=201)    
    except:
       return JSONResponse(content={'message': 'Error Creating User'}, status_code=400)

@app.post("/login")
async def login(loginModel: LoginModel):
   email = loginModel.email
   password = loginModel.password

   try:
       user = pb.auth().sign_in_with_email_and_password(email, password)
       jwt = user['idToken']
       return JSONResponse(content={"token": jwt}, status_code=200)
   except:
       return JSONResponse(content={'message': 'There was an error logging in'}, status_code=400)


@app.post("/token")
async def validate(tokenModel : TokenModel):
    
    try:
        firebase = firebase_admin.initialize_app(cred)
    except:
        pass
    
    try:
        user = auth.verify_id_token(tokenModel.token)
        return JSONResponse(content={ "message" : user} , status_code=200)
    except Exception as e:
        return JSONResponse(content={"message" : "Token Error!"}, status_code=403)


@app.post("/reset-password")
async def validate(email : LoginModel):
    
    try:
        firebase = firebase_admin.initialize_app(cred)
    except:
        pass
    
    try:
        pass_link = pb.auth().send_password_reset_email(email.email)
        return JSONResponse(content={ "message" : "Password verification has been sent"} , status_code=200)
    except Exception as e:
        return JSONResponse(content={"message" : "Error: Email could'nt send!"}, status_code=403)

if __name__ == "__main__":
   uvicorn.run("main:app")