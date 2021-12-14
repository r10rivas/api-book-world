# API Book World

This application is a challenge inspired by the classic build a book API.


## Table of Contents
- [Challenge description](#challenge-description)
- [Requirements](#requirements)
- [How To Use](#how-to-use)

## Challenge description
The basic and classic books API with some extras, this is API includes authentication and versioning.

## Requirements
- Be based on TDD.
- Authenticate user for all endpoints.
- Include versioning.
- Use <a href="https://dbdiagram.io/d/61a7942b8c901501c0dbb553" target="_blank">this</a> modeling data.
- Endpoints:
  - Create user.
  - V1:
    - Book index
    - Book create (They should always have their writers and genres)
    - Book show
    - Book update
    - Writer index
    - Writer create
    - Writer show
    - Writer update

## How To Use
To clone and run this application, you'll need [Git](https://git-scm.com), [Ruby](https://www.ruby-lang.org/en/), ruby on rails and [Postgresql](https://www.postgresql.org/) installed on your computer. From your command line:


```bash
# Clone this repository
$ git clone https://github.com/r10rivas/api-book-world.git

# Install dependencies
$ bundle install

# Create database
$ rails db:create

# Run migrations
$ rails db:migrate

# Run seed
$ rails db:seed

# Run the app
$ rails server
```
