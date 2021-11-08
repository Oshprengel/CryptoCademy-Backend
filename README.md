# CryptoCademy-backend-Project4

CryptoCadeny is a crypto education website to simulate investing in crypto using fake money, before entering real crypto market.

# How It Works

- As a user, I should be able to land on the login page and create a new user with a password, then on submit Our createUserAttempt function it's called on submit. 

- Our createUserAttemp function then handles the event by checking if the username that it's being created doesn't already exists in our database and if it doesn't, that username with it's information will then be saved in our database.

- As a user, you'll be able to login with your username and password, which then on the login attempt, our loginCheck function would be called.

- Our login function then handles the event by checking in our database if there's a user with the fields of username and password that match what's being inputed. Then if password does not match it'll prompt an error.

# Technologies Used

- Ruby
- Rails
- ElephantSQL
- Cors
- Heroku