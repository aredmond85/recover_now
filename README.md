# RecoverNow
RecoverNow is a basic ticketing/reporting app in which users can submit reports or issues. It features an admin account and then you can upload and add new Heros and Villains and they will have their own bios attached to each report so the person can have a better understanding of who the Hero and Villain are.

## Prerequisites

The setup steps expect the following tools to be installed on the system.

- Github
- Ruby 2.4.0
- Rails 5.0.2

## Install
Clone the repository
```
git clone https://github.com/aredmond85/recover_now
```
cd recover_now

## Set up the Database

Run the following commands to create and setup the database: 

```
  bundle exec rake db:create
  bundle exec rake db:setup
```
## Set up .env file 

`bundle add dotenv` and `bundle install` 

Visit https://console.developers.google.com/apis/credentials to create your Client ID and Secret Key to add to the .env file.

## Starting the Server
You can start the rails server using the following command: 
```
  rails s
```

Visit the site at: http://localhost:3000

## License 

Distributed under the MIT License. See LICENSE for more information.

## Contributing 

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

## Acknowledgements 

- Flatiron School 
- @aredmond85