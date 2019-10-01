# GoodBuy!

GoodBuy makes you BuyGood!

Want to buy something with your colleagues/friends but still bothered by handling complicated orders?

Goodbuy provides a platform which helps people arrange orders / manupulates calculations and even collects the money for you!


## Table of content

[Requirements](#Requirements)  
[Usage](#Usage)  
  - [Install Dependency](#Install-Dependency)  
  - [Prepare Database](#Prepare-Database)
  - [Start server](#Start-server)
  - [Check routes](#Check-routes)

[Manage groups if you are a owner](#Manage-groups-if-you-are-a-owner)  
  - [Create a new group](#Create-a-new-group)
  - [Create a group with public menu](#Create-a-group-with-public-menu)
  - [Create a group with previous one](#Create-a-group-with-previous-one)
  - [Close a group](#Close-a-group)
  - [Monitoring group status](#Monitoring-group-status)

[Attend groups if you are a buyer](#Attend-groups-if-you-are-a-buyer)
  - [Buy things](#Buy-things)
  - [Monitoring group status](#Monitoring-group-status)

## Requirements

- Ruby version 2.6.0
- Rails version 5.2.3
- PostgreSQL 11.3

## Usage

### Install Dependency

```s
$ bundle install
```

### Prepare Database

If you didn't have database.

```s
$ rails db:setup
```

### Start server

Start Rails server.

```s
$ rails s
```

### Check routes:

Check rails routes for more detail:

```
$ rails routes
```

| Pages                         | Prefix                | URI Pattern                 |
| :-----------------------------| :-------------------- | :-------------------------  |
| User sign up:                 | new_user_registration | `/users/sign_up(.:format)`  |
| User sign in:                 | new_user_session      | `/users/sign_in(.:format)`  |
| User edit:                    | edit_user_registration| `/users/edit(.:format)`     |
| Groups you owned:             | my_groups             | `/groups/my(.:format)`      |
| Groups you attended:          | attend_groups         | `/groups/attend(.:format)`  |
| Public menus:                 | public_groups         | `/groups/public(.:format)`  |
| Buy things:                   | buy_groups            | `/groups/:id/buy(.:format)` |
| Edit group:                   | edit_groups           | `/groups/:id/edit(.:format)`|
| Create a new group :          | new_groups            | `/groups/new(.:format)`     |
| Monitor group status:         | group                 | `/groups/:id(.:format)`     |


***

## Manage groups if you are a owner

After login with email or with Facebook/Google account, if you want to be a group owner, there are some options for you

- Create a new group

Visit `/groups/new`, you are able to build a new group with group title, products, options, etc... 

- Create a group with public menu

Sometimes it's really lousy to type all the products / options all over again. One option for you is to build one with public menu! Just visit `/groups/public` and choose one public menu you like, and of course you can customize what you really need.

- Create a group with previous one

If you've already created a group before, and need to copy the same group again. No problem! Visit `/groups/my` and you can copy a group just by clicking the green button in status column.

- Close a group

As a group owner, surely you have the right to close the group, once you close the group, no one can buy things in this group. 

-  Monitoring group status

Just visit `/groups/:id`, GoodBuy has already build a table for you to monitor the current status, including how many people attend the group, the total price, etc...

***
## Attend groups if you are a buyer

Once a group owner share a link with you, you are able to attend a group after login.

-  Buy things

Visit buy group page and now it's your shopping time! You can also 


-  Monitor group status

Also, you can monitor the current status of the group you've attended. The only difference is that you are NOT authorized to edit the group unless you are the owner.


