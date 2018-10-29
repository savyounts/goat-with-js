# Get Out And Travel (GOAT)

Goat is an app that uses a Rails backend with JavaScript. Users can log on and keep track of trips they are currently planning. Users can create trips that they can edit and update for themselves and they can also create destinations full of information about places around the world that all other users can see and add to their trips. Users can also comment on destinations they have not created to let the creator (or other users looking at it) other good or bad things about that destination.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Installing

First fork and clone a copy of the repository

```
git clone (link)
```

Once cloned, cd into the goat repo

```
git cd goat
```

Then bundle install to install any gems and/or dependencies

```
bundle install
```

Run the rails server and head to http://localhost:3000 in the browser

## Running the tests

There are rspec model tests for destinations, plans, trips and users. You can run these using.

```
rspec spec/models/[filename]
```

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used
* [JavaScript](https://www.javascript.com/) 
* [Sqlite](https://www.sqlite.org/) - Database management

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Savannah Younts** - *Initial work* - [Sav Younts](https://github.com/savyounts)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
