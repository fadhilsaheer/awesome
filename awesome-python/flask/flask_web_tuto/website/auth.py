from flask import Blueprint, render_template, request, flash, redirect, url_for
from .models import User
from werkzeug.security import generate_password_hash, check_password_hash
from . import db

auth = Blueprint('auth', __name__)


@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        user = User.query.filter_by(email=email).first()
        if user:
            if check_password_hash(user.password, password):
                flash('Logged in successfully !', category='success')
                return redirect(url_for('views.home'))
            
            else:
                flash('Invalid credentials !', category='error')
        else:
            flash('User does not exist', category='error')

    return render_template("login.html")


@auth.route('/logout')
def logout():
    return "<p>Logout</p>"


@auth.route('/signup', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        email = request.form.get('email')
        name = request.form.get('name')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        user = User.query.filter_by(email=email).first()

        if user:
            flash('User already exists', category='error')

        elif len(name) < 3:
            flash("Your name is too short", category='error')

        elif password1 != password2:
            flash("Password don't match", category='error')

        # elif len(password1) < 7:
        #     flash("Password is too short", category='error')

        else:
            new_user = User(email=email, name=name, password=generate_password_hash(password1, method='sha256'))
            db.session.add(new_user)
            db.session.commit()

            flash("Account created !", category='success')
            return redirect(url_for('views.home'))

    return render_template("sign_up.html")
