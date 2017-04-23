# Polymer Rails Example
The demo page is using [polymer](http://polymer-project.org/) to interact with web-server which is base on RoRs. This example will simulate the "order" process of a simple coffee shop.

LIVE DEMO: [https://coffee-shop-polymer.herokuapp.com/](https://coffee-shop-polymer.herokuapp.com/)

### Usage

After downloading, then execute:

    $ bundle

Create database and initial data for the shop:

    $ rake db:create db:migrate db:seed

* All initial data can be found in `db\seeds.rb`. You can either add or modify the data in there.
* Polymer's elements are located in `app\assets\components\`

### Test
Tests can be found in `spec\models\` and `spec\controllers\`

Run all with:

    $ rspec
