# [Viewing Party](https://github.com/drewwilliams5280/viewing_party)

Viewing party is an application that utilizes the Movie Database API. In which users can explore movie options and create a viewing party event for the user and their friends.

[Heroku app](https://viewing-party-drew.herokuapp.com/)

## Summary

  - [Getting Started](#getting-started)
  - [Versioning](#versioning)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)
  - [Authors](#authors)

## Getting Started

The below instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

## Local Setup

You can find the repo for this project [here](https://github.com/drewwilliams5280/viewing_party)

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
  - Gems: Faraday, Figaro
  - Testing Gems: ShouldaMatchers, Webmock, VCR
3. Setup the database: `rails db:create`

## Versioning

We used the following versions for this project.

- Ruby 2.5.3

- Rails 5.2.4.3

## Running the tests

To run all of the tests, you will use `bundle exec rspec`

To run a specific test, you will use `bundle exec rspec:<test line number goes here>`

## Deployment

From the command line, do the following:
  - `heroku create`
  - `git push heroku master`
  - `heroku run rake db:migrate`
  - You may also want to run the following command to seed your heroku database:
  - `heroku run rake db:seed`

## Authors

  - [**Drew Williams**](https://github.com/drewwilliams5280)
  - [**Dani Coleman**](https://github.com/dcoleman21)
