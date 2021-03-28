from flask import Blueprint

auth = Blueprint('auth', __name__)


@auth.route('/login')
def login():
    return "<p>Login</p>"


@auth.route('/logout')
def logout():
    return "<p>Logout</p>"


@auth.route('/signup')
def sign_up():
    return "<p>signup</p>"
