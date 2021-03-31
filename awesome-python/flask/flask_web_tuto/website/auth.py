from flask import Blueprint, render_template, request, flash

auth = Blueprint('auth', __name__)


@auth.route('/login', methods=['GET', 'POST'])
def login():
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

        if len(name) < 3:
            flash("Your name is too short", category='error')

        elif password1 != password2:
            flash("Password don't match", category='error')

        # elif len(password1) < 7:
        #     flash("Password is too short", category='error')

        else:
            flash("Account created !", category='success')

    return render_template("sign_up.html")
