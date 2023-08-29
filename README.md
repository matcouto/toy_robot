# Toy Robot Challenge

- [Description](./docs/description.md#description)
  - [Constraints](./docs/description.md#constraints)
  - [Deliverables](./docs/description.md#deliverables)
- [Setup](./README.md#setup)
- [Running the game](./README.md#running-the-game)
- [Running the tests suit](./README.md#running-the-tests)

## Setup

### Step 1: Git Clone the toy_robot repo and change to the toy_robot directory:

```bash
git clone https://github.com/matcouto/toy_robot.git && cd toy_robot

```

### Step 2: Install Bundler Gem

```bash
gem install bundler
```

### Step 3: Install Dependencies

```bash
bundle install
```

## Running the game

Once you have completed the steps above, you are ready to excute the application:

```
ruby src/main.rb
```

You can use the test data provided [here](./test_data.txt) to test the application.

## Running the tests:

```
bundle exec rspec spec/
```

## Checking test coverage:

```
bundle exec rspec && open ./coverage/index.html
```
