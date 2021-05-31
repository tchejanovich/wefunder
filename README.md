# WeFunder

## Prerequisistes

Make sure you have the following requirements installed:

- [rbenv](https://github.com/rbenv/rbenv)
- [Ruby on Rails](https://rubyonrails.org/)
- [Prerequisistes for RMagick](https://github.com/rmagick/rmagick)
- [bundler](https://bundler.io/)
- [PostgreSQL](https://www.postgresql.org/)

## Getting started

Make sure you have Postgres running and create a database named `wefunder`. Then configure your credentials on `config/database.yml` file.

Run the following commands:

```
bundle install
```

```
rake db:migrate
```

```
rails s
```

The application should be available on `localhost:3000`.
