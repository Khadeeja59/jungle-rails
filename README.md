# Jungle

A mini e-commerce application built with Rails 4.2.

## Features
- Users can register, login and logout.
- Users can see all the products.
- Users can add products to their cart, remove items, and pay.
- Admins have access to a dashboard of the products and categories.
- Admins can add/remove products and add categories.

## Screenshots

Display of all the products.
!["Display of products"](https://github.com/Khadeeja59/jungle-rails/blob/master/docs/products_display_page.jpeg?raw=true)

Cart page.
!["Cart page"](https://github.com/Khadeeja59/jungle-rails/blob/master/docs/cart_page.jpeg?raw=true)

Admins can add products.
!["Add products"](https://github.com/Khadeeja59/jungle-rails/blob/master/docs/admin_add_products.jpeg?raw=true)

Admins can add differet categories.
!["Add Categories"](https://github.com/Khadeeja59/jungle-rails/blob/master/docs/admin_add_categories.jpeg?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Rspec (for testing)
* Capybara (for testing)
