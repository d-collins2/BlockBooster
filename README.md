# Block Booster
## [Live Demo](https://www.youtube.com/watch?v=fC4D09zaoDA)

This Rails app was deisgned to allow users to search for they're favorite and/or upcoming movies and allow them to keep track of those movies. 



## Contents

- [Essential Gems](#essentual-gmes)
- [Installation](#installation)
- [Models](#models)

## Essential Gems

This app was created by running ```rails new blockbooster```, which prepared the application to perform as a web app. [Json](https://github.com/flori/json) which allows us to parse and generate JSON. [Rest Client](https://github.com/rest-client/rest-client) a simple HTTP and REST client for Ruby which I used to send get request to the movie api's server. [Devise](https://github.com/plataformatec/devise/) allows me to store a user's password securely through a hashing algorithm. 

## Installation 

To get started with this application, fork and clone the respository to your hard drive. ```CD``` into the project folder and run ```bundle install```. Once the gems have been installed, run ```rake db:setup``` to establish and seed the database. Make sure you have [postgreSQL](https://postgresapp.com/) installed and already running. Run ```rails start``` once the database has been set up to host the backend on your local server. The api I used can be found at [The Movies Db](https://developers.themoviedb.org/) which I found to very beginner friendly and allowed for free access to their robust api. 

## Models

There are 4 models which Task Haven utilizes: 

### Favorite

The ```Favorite``` model is a join table between a ```User``` instance and a ```Movie``` instance. A movie can be added to a users favorites through the click of a button. This creates a ```Favorite``` instance which is shown in when the star on the navigation bar is clicked. 

### Movie 

The ```Movie``` model handles all of the movies which are gotten from The Movies Db api. They are split by domestic and foreign films. Each category is further split depending on today's date. If a film is after today's date then they are shown apart of the upcoming films section and vice versa. 

### User

The ```User``` model handles all aspects of user accounts, including login/signup, and editing information. The Devise gem handles the password encyption in the app.



