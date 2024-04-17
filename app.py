"""Blogly application."""

from flask import Flask
from models import db, connect_db
import os
from dotenv import load_dotenv

load_dotenv('.env')

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

with app.app_context():
    connect_db(app)
    db.create_all()

@app.get('/')
def index():
    return "<h1>Hello world!</h1>"