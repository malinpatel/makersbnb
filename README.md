# MakersBNB

This project represents our sixth weekly challenge at **Makers Academy** coding bootcamp.

MakersBNB is a **web app** used for letting properties. Some of the features allow a user to sign up, log in, log out, see a list of available properties, add a property, make a request for a property, accept or decline a request and much more. All the user stories are listed below.

The project is a basic copy of Airbnb and was made by a team of 4 people in 5 days. We managed to get an **MVP** running in 3 days while using the **XP values** and **development workflow**.   

The site is live on **Heroku** https://makers-bnb-gpmt.herokuapp.com/.

## Installation and Use

1. To run the program locally clone or download the repository.
2. Run **bundle install**.
3. This repo runs on two databases
```
makersbnb_test
makersbnb_development
```
You will need to create these databases with postgreSQL
```
$ psql
# CREATE DATABASE makersbnb_test;
# CREATE DATABASE makersbnb_development;
#\q
$
```
4. Run **ruby ./app/app.rb**.
5. In your browser, open the link **localhost:4567**.
6. Enjoy the web app.

## Technologies used

* The **Sinatra** framework as our DSL.
* **Bootstrap** for styling.
* **Heroku** for cloud deployment.
* **BCrypt** for password hashing.
* **PostgresSQL** as our database.
* **DataMapper** as object relational mapper.
* **Capybara** and **Rspec** for testing.
* **DatabaseCleaner** for database upgrading and migration.
* **Rake** for automating tasks.
* **Github** for code collaboration.
* **Waffle** for organising our workflow.

## User Stories

```
As a lettor,
So that I can let a space
I want to sign up.

As a lettor,
So that I can let my property
I want to list a new space.

As a lettor
So that I can let multiple spaces
I want to list multiple spaces.

As a lettor
So that guests can find my property
I want to name my space.

As a lettor
So that I can better sell my property
I want to describe my space.

As a lettor
So that guests know the price
I want to add a price for my space.

As a lettor
So that guests know when my property is available
I want to show a range of available dates.

As a guest
So that I can rent a space
I want to sign up.

As a guest
So that I can rent a space
I want to select from a list of properties.

As a guest
So that I can rent a space
I want to make a request to the owner.

As a lettor
So that I can let a space
I want to approve a request.

As a lettor
So that my space isn't double booked
I want the booked dates not to be available for booking.

As a lettor
So that I can take more bookings
I want my space to be available until I approve a request.
```

## Contacts

* [George Seeger](https://github.com/GeorgeSeeger)
* [Pea M Tyczynska](https://github.com/CrystalPea)
* [Malin Patel](https://github.com/malinpatel)
* [Tudor Tacal](https://github.com/TudorTacal)
