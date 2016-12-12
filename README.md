# MakersBNB

## Setup

This repo runs on two databases
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
So I can rent a space
I want to sign up.

As a guest
So I can rent a space
I want to select from a list of properties.

As a guest
So I can rent a space
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
