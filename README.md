<p align="center">
  <h2 align="center">Alpha Blog</h2>
</p>

<br>

https://github.com/neonklr/Alpha-Blog/assets/55053464/58c1e4d4-15c6-410a-ba83-c9b3b952f69f


Alpha Blog is a Ruby on Rails 6 application that provides a range of features to enhance the user experience. The application includes authentication and authorization functionality, which is implemented using devise gems, and ActiveAdmin for administration purposes. The major focus of the application is on the users, articles, and categories.  

In addition to standard CRUD functionality, Alpha Blog includes several advanced features. Users can search for articles, users, and categories. Users can also follow other users and be followed by other users which will enable them to see content posted by users they follow on their feed.  

Alpha Blog also includes a “my feed” section per user, where the articles from the users you follow is shown. Overall, Alpha Blog is a comprehensive and user-friendly application that provides a range of features to enhance the user experience. The application includes advanced functionality such as search, and social features, as well as standard CRUD operations and administration capabilities. With its focus on articles, categories, and user engagement, Alpha Blog is a valuable resource for anyone looking to create, share, or discover quality content.

## Major Features

- Custom and admin authentication using devise
- Admin panel using active admin gem
- Pagination using will_paginate gem
- Styling using bootstrap and scss
- Search functionality
- CRUD operation on users, articles, categories
- Sub admin feature for managing categories and featured articles
- Follower and following user functionality
- Application testing using rspec

## Technologies Used

- Ruby
- Rails
- Devise
- Bootstrap
- RSpec

## Running This Project

To run this project follow the steps below :-

1. Clone this repo.
2. Navigate to project directory.
3. go to `config/database.yml` and change the port `5433` to the port on which your postgresql service runs/will run
4. Start postgresql server

```
sudo service postgresql start
```

5. Check postgresql status using

```
sudo service postgresql status
```

6. if you are running for the first time and/or not have necessary tables in postgres defined under `config/database.yml`, use `rake db:setup` to make necessary tables and seeds (`rake db:setup` is equivalent to running `rake db:create` -> `rake db:migrate` -> `rake db:seed` in order)

7. Start rails server (using any of the following commands)

```
rails server
```

```
rails s
```
