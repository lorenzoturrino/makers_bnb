
[![Build Status](https://travis-ci.org/lorenzoturrino/makers_bnb.svg?branch=master)](https://travis-ci.org/lorenzoturrino/makers_bnb)


# Lab Week - MakerBnB

## Challenge:

#### A web application that allows users to list and book spaces

### Challenge specifications

* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.


### Approach

1. The idea was to create a MVP first, with the core user stories. The functions that we identified were:

  ```
  As a host,
  So that I can promote my space,
  I want to create a new space
  ```
  ```
  As a person
  So I can use Makersbnb
  I want to sign up
  ```
  ```
  As a developer,
  So that the hosts are display with the right space,
  I want my spaces to have a one to many relation with users.
  ```
  ```
  As a Host,
  So that I can show when my space is available,
  I want to be able to set availability dates for my spaces
  ```

  ```
  As a guest,
  So that I can choose a property that is available,
  I want to filter the spaces by a available date.

  ```
  ```
  As a Guest,
  So that I can organise my trip,
  I would like to see if my requests were declined or accepted.
  ```
2. The user stories that followed were expansions of our core stories, which enabled us to avoid merge conflicts, as the teams were able to work on functionalities independent of one another.

3. Once we had completed the core specification provided us by Makers we started working on the CSS.

### Technology

* Ruby
* JS
* RSPEC
* Sinatra
* SQL --> PSQL

### Installation

```
$ git clone https://github.com/lorenzoturrino/makers_bnb.git
$ bundle
$ PSQL
$ database create bnb_development
$ database create bnb_test
$ rake db:migrate
```
### Screenshots & Link

 Live Version: http://homereservationapp.herokuapp.com/
