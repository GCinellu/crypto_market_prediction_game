# Crypto Market Prediction Game

As a newbie in the crypto market investments I felt the urge of creating a simple tool to estimate my capacity of estimating fluctuations in value.

This is my idea for this project:

* Being able to authenticate and create an account on the platform. I will use Devise until I might split it in client/api

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

I know, I should focus straight away on the game's logic, but Devise makes it so easy...

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

#### 0.0.1
Configured scheduling with Sidekiq and a job to fetch Bitcoin prices from Coinbase.
Prices are now stored in the database in a `exchange_price` column.
  