# _Hair Salon Application_

#### _A web app that allows the owner of a hair salon to register their stylists and register clients with each stylist._

#### By _**Ezra Sandzer-Bell**_

## Specifications

* _contains stylist and client classes_
* _inputs stylist information to database table "stylists"_
* _draws id from "stylists" table to generate stylist_id for each client_
* _makes use of if/then statements to hide and show content_

## Setup/Installation Requirements

_Works in any web browser. To run Contacts Storage Application, in command line run:_

```
$ git clone https://github.com/ezrasandzerbell/hair_salon
$ cd train_system
$ bundle

Open new terminal tab, in command line run:
$ postgres

Open new terminal tab, in command line run:
$ psql

In psql tab, enter the following lines of code to command line:

* _CREATE DATABASE hair_salon;_
* _\c hair_salon;_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_

Open new terminal tab, in command line run:
$ ruby app.rb

Open web browser:

enter "localhost:4567" in web browser

App should load in browser.

```

## Support and contact details

_Contact me at equilibriumarts@gmail.com_

## Technologies Used

* _HTML_
* _CSS_
* _Bootstrap_
* _Ruby_
* _Sinatra_
* _Postgres_


### License

Hair Salon is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Hair Salon is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the Hair Salon. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Ezra Sandzer-Bell_**
