"""Blogly application."""

from flask import Flask, render_template, redirect, request
from models import User, db, connect_db, Post
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


@app.get('/users/<int:user_id>/posts/new')
def displayNewPostForm(user_id: int):
    """Show form to add a post for that user."""
    user: User = User.query.get(user_id)
    return render_template('newPost.html', title="New Post", user=user, post={})


@app.post('/users/<int:user_id>/posts/new')
def processNewPostForm(user_id: int):
    """Handle add form; add post and redirect to the user detail page."""

    # title, content
    form_title = request.form.get('title', '')
    form_content = request.form.get('content', '')

    # data validation
    validation_errors = []
    if not form_title:
        validation_errors.append('Title is required.')
    if not form_content:
        validation_errors.append('Content is required.')

    if validation_errors:
        return render_template('newPost.html', post={}, title='Add Post', errors=validation_errors)

    # create post with data
    post = Post(title=form_title, content=form_content, author_id=user_id)

    db.session.add(post)
    db.session.commit()

    # redirect
    return redirect('/users/' + str(user_id))


@app.get('/posts/<int:post_id>')
def getPostInfo(post_id: int):
    """Show a post. Show buttons to edit and delete the post."""
    post: Post = Post.query.get(post_id)
    return render_template('postDetails.html', post=post)


@app.get('/posts/<int:post_id>/edit')
def displayEditPostForm(post_id: int):
    """Show form to edit a post, and to cancel (back to user page)."""
    post = Post.query.get(post_id)
    return render_template('editPost.html', post=post, title="Edit Post")


@app.post('/posts/<int:post_id>/edit')
def processEditPostForm(post_id: int):
    """Handle editing of a post. Redirect back to the post view."""

    post: Post = Post.query.get(post_id)

    # title, content
    form_title = request.form.get('title', '')
    form_content = request.form.get('content', '')

    # data validation
    validation_errors = []
    if not form_title:
        validation_errors.append('First name is required.')
    if not form_content:
        validation_errors.append('Last name is required.')

    if validation_errors:
        return render_template('editPost.html', post=post, title='Edit Post', errors=validation_errors)

    # create post with data
    post.title = form_title
    post.content = form_content

    db.session.add(post)
    db.session.commit()

    # redirect
    return redirect('/users/' + str(post.author_id))


@app.post('/posts/<int:post_id>/delete')
def processDeletePost(post_id: int):
    """Delete the post."""

    # get post to delete
    post: Post = Post.query.get(post_id)

    # delete user
    db.session.delete(post)
    db.session.commit()

    return redirect('/users/' + str(post.author_id))
