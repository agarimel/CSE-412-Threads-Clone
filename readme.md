# Threads Clone


Built with the Flask framework in Python, this project is a replica of Threads encompassing both front-end and back-end components. While it may not feature all the functionalities of Threads, it adeptly performs the essential functions integral to Threads, specifically:

1. Login and logout functionalities with a login and cookie manager system.
2. Creating own account and update and customize (with setting own profile pictures and image management system).
3. CRUD operations on all your threads.
4. Reposting other perople's threads.
5. Looking up other users profile.

## Screenshots

Strived to uphold a UI reminiscent of Threads. Nevertheless, it presently lacks mobile responsiveness, making landscape mode preferable when viewed on a laptop or desktop. This omission is attributed to the project's primary focus, which centers around the creation of a fully functional, generic social media website, rather than prioritizing the development of a frontend site.


Welcome login/signup page


Home page


User account page

## Database Schema

According to the current functionalities there are 5 tables in the schema. The User has all the info on the user, the Post links the creted posts to their author as:

    User.id --> {author} --> Post.user_id

The Retweets have a different table that the Posts as they point to instances within the Post themselves. Their connection is given as:

    Post.id --> {ori_post} --> Retweet.tweet_id
    User.id --> {retwitter} --> Retweet.user_id

The Timeline table keeps track of all the posts and the reposts that were created since day zero. Their relationship is given as:

    Post.id --> {from_post} --> Timeline.post_id
    Retweet.id --> {from_retweet} --> Timeline.retweet_id

The Bookmark keeps track of all the posts that the user saves as a bookmark, Their relationship is given as :

    Post.id --> {saved_post} --> Bookmark.post_id
    User.id --> {saved_by} --> Bookmark.user_id

__NOTE :__ This portion is yet to be implemented
The Bookmark Table joins the User table with the Posts that the user saves. Relationship given as:

    User.id --> {by_user} --> Bookmark.user_id
    Post.id --> {saved_post} --> Bookmark.post_id

The complete schema structure is given below:



__To Access the database in more detail, go [here](https://dbdiagram.io/d/5f7185f53a78976d7b757403)__

## Note

1. The database has been built on SQLite browser using SQLAlchemy so is not currently scalabe. But due to Flask's upwards compatibility, can be shifted to PostgreSQL whenever needed.
2. The login management system hashshes the passwords and follows a strict cookie management and uses flask_login_manager to time the user sessions and hence provides intermediate level of protection.
3. Built using a virtual environment so can be easily downloaded and run on your local machine.

### To run on your machine

    1. Download/clone this repository to your local machine
    2. Make sure you have the right python version setup. Install the dependencies using - `pip install -r requirements.txt`
    3. Activate the virtual environment using - `./env/Scripts/activate`
    4. Return to the root directory and start the server running @localhost:5000 using - `python run.py`

### Test User Credentials

1. Username : JaneDoe
2. Email : test@test.com
3. Password : Admin123

## Things yet to do

1. Add follow user/following functionality.
2. Add ability to like posts
3. Add 'forgot password' functionality.

## Contributing

Although this is not a fully fledged open source project, it never hurts to get some help :)
Go through the Issues listed. Most of them are beginer friendly and should be good enough for your first PR!
