from fastapi import FastAPI
import json


app = FastAPI()


@app.get("/foods")
async def food_data():
    f = open('foods.json')
    data = json.load(f)
    f.close()
    return data

@app.get("/exercises")
async def training_data():
    f = open("exercises.json")
    data = json.load(f)
    f.close()
    return data