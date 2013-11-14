###Drinking Dash

####Overview

Drinking Dash is our version of the [Dinner Dash](http://tutorials.jumpstartlab.com/projects/dinner_dash.html) tutorial themed as a bar with in restaruant online ordering.

####Instructions

#####Setuping Locally

1. Clone the repository.
  `git clone https://github.com/Egogre/drinking_dash.git`
2. Move into that directory.
  `cd drinking_dash`
3. Install gem dependencies.
  `bundle install`
4. Make sure you have Postgres installed on your computer.
   We recommend either installing it through the [Postgres.app](http://postgresapp.com/) or [Homebrew](http://russbrooks.com/2010/11/25/install-postgresql-9-on-os-x)
5. Create and seed the database.
   `rake db:create db:seed`
6. Start the Rails sever.
   `rails s`

####Test Version(WIP)
Running Tests
```ruby
rake db:migrate
```

```ruby
rake db:test:load
```

To purge the test database - run

```ruby
rake db:test:purge
```

#####Version in Production
Visit[this heroku site]( https://desolate-plateau-1371.herokuapp.com/) for a live version.

![Code Coverage](https://www.monosnap.com/image/nHhBywlaT7y2N4dSRRxFt1gst, "Code Coverage!") 
