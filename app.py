"""Blogly application."""

from flask import Flask, render_template, redirect
from models import User, db, connect_db
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
    """Redirect to list of users."""
    return redirect('/users')


@app.get('/users')
def getUsers():
    """get list of users"""
    return render_template('listUsers.html', users=[])


@app.get('/users/new')
def displayNewUserForm():
    """show user add form"""
    return render_template('newUser.html', user=User())


@app.post('/users/new')
def processNewUserForm():
    """process add form, redirect to /users"""
    return redirect('/users')


@app.get('/users/[int:user_id]')
def getUserInfo(user_id):
    """display user info"""
    return render_template('userDetails.html', user=User())


@app.get('/users/[user_id]/edit')
def getUserEditForm(user_id):
    """display user edit form"""
    return render_template('editUser.html', user=User())


@app.post('/users/[user_id]/edit')
def processUserEditForm(user_id):
    """process user edit form, redirect to /users"""
    return redirect('/users')


@app.post('/users/[user_id]/delete')
def processDeleteUser(user_id):
    """delete user (redirect to /users)"""
    return redirect('/users')
