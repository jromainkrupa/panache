# Panache

Version 1 for Panache.  

# Getting Started
You'll need the following installed to run the application
* ruby 2.6 or higher
* bundler - `gem install bundler`
* PostgreSQL - `brew install postgresql`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)

# Database structure
* Clubs and Events are 2 separated tables
* A Club belongs to a User
* An Event belongs to a User
* An Event eventually belongs to a club
* A Club or An Event has many sports through ClubSport

# Test suite
Only model tests are present using Rspec.

## Frontend setup
* TailwindCss as CSS library with webpack
* We use stimulus as a modest JS framework with tailwind-stimulus-components

# Deployment instructions
A staging environment has been set with a Continuous Deployment. Two rake tasks are present to seed sports from a CSV and 2021 events from a JSON. Those rake tasks don't destroy the datas. 

```bash
git push staging 
heroku run rails db:seed
heroku run sport:create --remote staging
heroku run event:create --remote staging
```

