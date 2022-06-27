import db

from fastapi import FastAPI


app = FastAPI()


@app.get("/")
def root():
    msg = "aa"
    return msg
