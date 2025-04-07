# Testing with RSpec

This project demonstrates how to write and organize tests in a Ruby on Rails application using [RSpec](https://rspec.info/). It includes examples of model and controller specs, along with a working GitHub Actions workflow for continuous integration.

## 🧪 What’s Included

- **Model specs**: Validations and custom method testing
- **Controller specs**: Request handling, redirection, flash messages, and error handling
- **RSpec setup**: Basic structure and syntax for RSpec
- **GitHub Actions CI**: Automatic test runs on push and pull requests using Ruby and PostgreSQL

## 📂 File Structure

```
.github/
└── workflows/
    └── ruby.yml                    # CI workflow that runs tests using GitHub Actions

spec/
├── controllers/
│   └── tasks_controller_spec.rb    # Tests for TasksController#create
├── models/
│   └── task_spec.rb                # Tests for Task model validations and methods
├── rails_helper.rb
└── spec_helper.rb
```

## ✅ How to Run the Tests Locally

Make sure you have the necessary setup:

```bash
bundle install
rails db:create db:migrate RAILS_ENV=test
bundle exec rspec
```

## 🚀 Continuous Integration (CI)

This project uses GitHub Actions to run the test suite automatically whenever code is pushed to the `master` branch or a pull request is opened.

Check `.github/workflows/ruby.yml` for the CI setup.

## 🙏 Acknowledgments

This project is a slightly modified version of the **Testing with RSpec** workshop by **[Paulo D'Alberti](https://github.com/Naokimi)**, created during the Le Wagon bootcamp.

Original repos: [Naokimi/testing_with_rspec](https://github.com/Naokimi/testing_with_rspec) and [Naokimi/rails-task-rspec](https://github.com/Naokimi/rails-task-rspec)

All credit for the original code goes to Paulo D'Alberti — this version was made for personal learning and experimenting with RSpec, testing, and CI setup.
