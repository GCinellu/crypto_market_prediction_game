# Crypto Market Prediction Game

As a newbie in the crypto market investments I felt the urge of creating a simple tool to estimate my capacity of estimating fluctuations in value.

This is my idea for this project:

* Being able to authenticate and create an account on the platform. ~~I will use Devise until I might split it in client/api~~ I ditched Device and created a custom JsonWebToken module to handle JWT encoding/decoding.

* For each coin, the user should be able to create predictions based on: 
    * How much a coin will go up
    * In how long

* The system should tell how accurate the user is or how much he/she fucked up

* Players should be able to see their scores on a leaderboard.
    * Several boards are possible, like 'most accurate', 'biggest gainer', or 'donks' for people whose just aren't cut for it.

* A job scheduler should get coins' prices from various API

## What is there so far

I started by creating the scheduler because the game involves predictions, implying something has to constantly check all the bets in order to match their value in the estimated time. 

As for when I'm writing, the jobs are already configured to be handled by Sidekiq, while the scheduling is done with Rufus as an initialized in the `config/initialisers` folder.

To avoid calling the many exchanges every time I need to check a bet, I believe I should store prices informations on a separate table, handling the parsing on a different queue.

For the moment I only wrote a parser for the Coinbase's API, but it's now easy to add new ones as classes in the `app/jobs` folder and by configuring Rufus's initialiser.

## What is up next

Since I want this to be a game, I see creating the user part as the next natural step.

~~I know, I should focus straight away on the game's logic, but Devise makes it so easy...~~
Creating the authentication system was a good call, there's good test coverage and I already configured a callback to use in the controllers, which will speed up being online in the first 0.X release


Next up I'll be focusing straight on the game's logic.

## How to run the project

If you're not familiar with Rails, taking a quick tutorial on how to install it on your machine is a must.

After cloning the repo, from its root folder run the classic

`bundle install`

in order to install all the necessary dependencies.

As you can see in the `config/database.yml` file, the application runs on a Postgresql database, which development's username and password are both 'prediction_game' (pretty original, I know!)

If you're not familiar with booting a Rails application, you need to login into the database on your local machine and create the role mentioned in the database file

Something like this:

```
psql -d postgres // or whichever command you use to log in as postgres/admin user
CREATE ROLE prediction_game CREATEDB LOGIN;
ALTER ROLE prediction_game WITH PASSWORD 'prediction_game';
```

Now you can finally configure the database to be started

`rake db:create db:migrate`

And run the application with:

`puma`

## Changelog
#### 0.2.1
##### Backend
- Each method for each controller now test that for the number of attributes in the serialized response and ensure each field is what expected

#### 0.2.0
##### Client
- User's session informations are stored into sessionStorage. Upon rendering, the app checks for their existence and eventually initialise them in store
- Topnav: if the user's credentials are not there, a login form is shown
- Homepage: a banner invites the user to sign up if not authenticated, else a link to the dashboard is offered.
- Dashboard: The user can predict if the price of btc is going up or down in a given timeframe, and how much.
- Predictions and Predicteds: they are now visible from the dashboard page

##### Backend
- Controllers: JSONs are now serialised

#### 0.1.0
Predictions are there as json responses. As a user you will be able to make a prediction (for the moment only a small subset of coins, currencies, and exchanges is available) with an expiration day no longer than 7 days. In other words, your prediction should be in the short range.
Every minute, a job is scheduled to check which predictions are expired. The record is deleted, and with its informations a `Predicted` record is created, adding the price at expiration and some few more properties.
In this way the scheduler doesn't have to run huge queries in order to check which predictions are still to be evaluated.

Next is going to be the React Client to actually play the game and see your results.
 
#### 0.0.2
Well, in the end I decided that I might not feeling like porting the whole thingy to an api in the future, so I decided to ditch Devise and organise a small authentication set myself.

In this version we see an improved User model with validations and the capacity to handle tokens.

I also created a method in the application controller that allows to verify if a user token is valid, Devise style.

I will now start working at the real betting system.

#### 0.0.1
Configured scheduling with Sidekiq and a job to fetch Bitcoin prices from Coinbase.
Prices are now stored in the database in a `exchange_price` column.
  