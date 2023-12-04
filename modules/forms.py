from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField, SubmitField, PasswordField, BooleanField, TextAreaField
from wtforms.fields.html5 import DateField
from wtforms.validators import DataRequired, Email, Length, ValidationError
from modules.modals import User_mgmt

class Signup(FlaskForm):
    username = StringField('Username',validators=[DataRequired(),Length(min=4)])
    email = StringField('Email',validators=[DataRequired(),Email()])
    password = PasswordField('Password',validators=[DataRequired(),Length(min=6)])
    signup = SubmitField('Sign up')

    def validating_username(self,username):
        user = User_mgmt.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('Username is already taken. Please choose a different one')

    def validating_email(self,email):
        user = User_mgmt.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('Account with this email ID already exists')

class Login(FlaskForm):
    username = StringField('Username',validators=[DataRequired()])
    password = PasswordField('Password',validators=[DataRequired()])
    remember =  BooleanField('Remember me')
    login = SubmitField('Login')

class post(FlaskForm):
    post = TextAreaField('What is on your mind?',validators=[DataRequired(),Length(max=500)])
    post_img = FileField('Include Image',validators=[FileAllowed(['jpg','png'])])
    submit = SubmitField('Post')

class UpdateProfile(FlaskForm):
    username = StringField('Username',validators=[Length(min=4)])
    email = StringField('Email',validators=[Email()])
    bio = StringField('Tell us a bit about yourself',validators=[Length(max=100)])
    profile = FileField('Update Profile Picture',validators=[FileAllowed(['jpg','png'])])
    profile_bg = FileField('Upload background image',validators=[FileAllowed(['jpg','png'])])
    bday = DateField('Add your birthday')
    save = SubmitField('Save Changes')

    def validating_username(self,username):
        if username.data != current_user.username:
            user = User_mgmt.query.filter_by(username=username.data).first()
            if user:
                raise ValidationError('Username is already taken. Please choose a different one')

    def validating_email(self,email):
        if email.data != current_user.email:
            user = User_mgmt.query.filter_by(email=email.data).first()
            if user:
                raise ValidationError('Account with this email ID already exists')