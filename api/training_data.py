from distutils.command.build_scripts import first_line_re
import requests , json
from bs4 import BeautifulSoup

datas = { "data" : [] }

baseUrl = "https://www.muscleandstrength.com/"

headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
}

def training():
    req = requests.get(baseUrl+"exercises", headers=headers)

    html_data = BeautifulSoup(req.content, "html.parser")

    firstElement = html_data.find("div", class_="mainpage-category-list")

    all_data = firstElement.find_all("div", class_ = "cell")

    
    i = 0
    for item in all_data:

        categoryName = item.find("div", class_="category-name").text

        sourceUrl = baseUrl  + "exercises/" + categoryName.lower() + ".html"
        
        imgUrl = item.find("a").find("img")["data-src"]


        categoryDatas = trainingContent(sourceUrl)

        json_data = {
            "categoryName" : categoryName,
            "imgUrl" : imgUrl,
            "categoryData" : categoryDatas
        }

        datas["data"].append(json_data)

        i += 1

        if i == 2:
            break
        
    
    with open('exercises.json', 'w', encoding='utf-8') as f:
        json.dump(datas["data"], f, ensure_ascii=False, indent=4)

def trainingContent(categoryUrl):
    req = requests.get(categoryUrl , headers=headers)

    html = BeautifulSoup(req.content, "html.parser")


    dataList = []

   

    for item in html.find_all("div", class_="cell small-12 bp600-6"):
        img = None

        try: 
            img = item.find("div" , class_="node-image").find("a").find("img")["data-src"]
        except:
            img = item.find("div" , class_="node-image").find("a").find("img")["src"]

        titles = item.find_all("div", class_ = "meta-box")

        type = titles[0].text.split("\n")[-1].strip()
        equipment = titles[1].text.split("\n")[-1].strip()
        mechanics = titles[2].text.split("\n")[-1].strip()
        exp_level = titles[3].text.split("\n")[-1].strip()


        exc_name = item.find("div", class_ = "node-title").find("a").text

        excUrl = item.find("div", class_ = "node-title").find("a")["href"]
        lastPageUrl = baseUrl + excUrl 
        
        videoPageData = scrapeVideoPage(lastPageUrl)
        
        js_data = {
            "contentImage": img, 
            "type" : type,
            "equipment" : equipment,
            "mechanic" : mechanics,
            "exerciseLevel" : exp_level,
            "exerciseName" : exc_name,
            "videoPageData" : videoPageData,

        }

        dataList.append(js_data)

    return dataList


def scrapeVideoPage(sourceUrl):
    req = requests.get(sourceUrl, headers=headers)

    html = BeautifulSoup(req.content , "html.parser")

    trainingVideoUrl = None

    try: 
        trainingVideoUrl =  html.find("iframe")["src"] 

    except:
        trainingVideoUrl = html.find("div" , class_="video").find("source")["src"]
        trainingVideoUrl = "https:" + trainingVideoUrl

    fullBodyImage = html.find("div" , class_="grid-x target-muscles").find("img")["src"]

    firstTitle = html.find("h2").text
    firstContent = None
    try:
        firstContent = html.find("div", class_ = "field field-name-field-exercise-overview field-type-text-long field-label-hidden" ).text
    except:
        firstContent = ""
        firstTitle = ""

    secondTitle = None
    try:
        secondTitle =  html.find_all("h2")[1].text
    except:
        secondTitle = html.find("div", class_ = "field field-name-body field-type-text-with-summary field-label-hidden" ).find("h3").text
    
    secondContent= html.find("div",class_ = "field field-name-body field-type-text-with-summary field-label-hidden").find_all("ol")
    if len(secondContent) > 1:
        secondContent = html.find("div",class_ = "field field-name-body field-type-text-with-summary field-label-hidden").find_all("ol")[0].text
    else:
        secondContent = html.find("div",class_ = "field field-name-body field-type-text-with-summary field-label-hidden").find("ol").text
    print("\n\n**********************************\n\n")
    print(firstTitle)
    print("\n\n**********************************\n\n")

    

    return { "videoUrl" : trainingVideoUrl , "fullBodyImage" : fullBodyImage, "firstTitle": firstTitle, "firstContent": firstContent,"secondTitle": secondTitle }



training()

