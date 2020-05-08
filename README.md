# Edoc-api 

![screenshot](screenshot.jpg)

Check out [front end](https://github.com/mosaaleb/edoc)

## Introduction
This is part of two part project in [Microverse](https://www.microverse.org/) curriculum
The project handle searching physicians by their speciality and handles creating appointments with patients.

It serves front end react application

react app: [edoc](https://github.com/mosaaleb/edoc/)

**Features**
- Mobile app
- Authentication with JWT
- Filtering physicians by category
- Creating appointments with physicians

## Built With
- Rails 6.0.2
- Rspec

### Prerequisites
- ruby 2.6.3
- bundle

### Setup
```
git clone git@github.com:mosaaleb/edoc-api.git
cd edoc
rails db:create db:migrate db:seed
```

### Running the project
- Clone the [front end](https://github.com/mosaaleb/edoc).
- Follow the instruction on how to setup the front end.
- Setup the back end part (check the Setup section).
- Start the server on both back end and front end.
```ruby
# back end rails
rails s
# front end react
npm start
```
- Start developing.

### Testing
The app is fully tested with `1:1.2` Code to Test Ratio
You can run all unit tests with:
`rspec`

## Author

- [Github](https://github.com/mosaaleb)
- [Linkedin](https://www.linkedin.com/in/muhammadebeid/)
- [muhammed.ebeid@gmail.com](muhammed.ebeid@gmail.com)

## Coming Features:
- [ ] Doctor profile page endpoint

**Having specific feature in mind?** 
Please [Submit](https://github.com/mosaaleb/edoc-api/labels/enhancement) it


## 🤝 Contributing
Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).


## 📝 License
This project is [MIT](lic.url) licensed.
