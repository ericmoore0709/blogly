"""Blogly application."""

from flask import Flask, render_template, redirect, request
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
    users: list[User] = User.query.all()
    print(users)
    return render_template('listUsers.html', users=users, title='User List')


@app.get('/users/new')
def displayNewUserForm():
    """show user add form"""
    return render_template('newUser.html', user={}, title='Add User')


@app.post('/users/new')
def processNewUserForm():
    """process add form, redirect to /users"""

    # first_name, last_name, image_url
    form_first_name = request.form.get('first_name', '')
    form_last_name = request.form.get('last_name', '')
    form_image_url = request.form.get('image_url', '')

    # data validation
    validation_errors = []
    if not form_first_name:
        validation_errors.append('First name is required.')
    if not form_last_name:
        validation_errors.append('Last name is required.')
    if not form_image_url:
        validation_errors.append('Image URL is required.')

    if validation_errors:
        return render_template('newUser.html', user={}, title='Add User', errors=validation_errors)

    # create user with data
    user = User(first_name=form_first_name,
                last_name=form_last_name, image_url=form_image_url)

    db.session.add(user)
    db.session.commit()

    # redirect
    return redirect('/users')


@app.get('/users/<int:user_id>')
def getUserInfo(user_id: int):
    """display user info"""
    user: User = User.query.get_or_404(user_id)
    return render_template('userDetails.html', user=user, title='User Info')


@app.get('/users/<int:user_id>/edit')
def getUserEditForm(user_id: int):
    """display user edit form"""
    user: User = User.query.get(user_id)
    return render_template('editUser.html', user=user, title='Edit User')


@app.post('/users/<int:user_id>/edit')
def processUserEditForm(user_id: int):
    """process user edit form, redirect to /users"""

    # get the original user
    user: User = User.query.get(user_id)

    # first_name, last_name, image_url
    form_first_name = request.form.get('first_name', '')
    form_last_name = request.form.get('last_name', '')
    form_image_url = request.form.get('image_url', '')

    # data validation
    validation_errors = []
    if not form_first_name:
        validation_errors.append('First name is required.')
    if not form_last_name:
        validation_errors.append('Last name is required.')
    if not form_image_url:
        validation_errors.append('Image URL is required.')

    if validation_errors:
        return render_template('editUser.html', user=user, title='Edit User', errors=validation_errors)

    # update user with data
    user.first_name = form_first_name
    user.last_name = form_last_name
    user.image_url = form_image_url

    db.session.add(user)
    db.session.commit()

    # redirect
    return redirect('/users')


@app.post('/users/<int:user_id>/delete')
def processDeleteUser(user_id: int):
    """delete user (redirect to /users)"""

    # get user to delete
    user: User = User.query.get(user_id)

    # delete user
    db.session.delete(user)
    db.session.commit()

    return redirect('/users')
