# Alpha-Blog

project made through the course : [The Complete Ruby on Rails Developer Course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/)

## Running This Project

To run this porject follow the steps below :-

- go to `config/database.yml` and change the port `5433` to the port on which your postgresql service runs/will run
- start the postgresql service using `sudo service postgresql start`
- check the status of service using `sudo service postgresql status` to ensure the port is correct and the service is up
- if you are running for the first time and/or not have necessary tables in postgres defined under `config/database.yml`, use `rake db:setup` to make necessary tables and seeds (`rake db:setup` is equivalent to running `rake db:create` -> `rake db:migrate` -> `rake db:seed` in order)
- run `rails server` or `rails s` to start the rails server
