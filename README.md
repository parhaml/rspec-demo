# README

Demo app for explaining RSpec concepts.

Basic Address valdation through the USPS



Requires a [USPS api key](https://www.usps.com/business/web-tools-apis/)


Remove any existing credentials file:

```
rm config/credentials.yml.enc
```
Create the secrets file with your api key above:
```
EDITOR=vim rails credentials:edit
```

Add the following

```
usps:
  user: <YOUR_API_KEY>
```

Migrate the database

```
rails db:migrate
```


from the console create a user and an address:

```
u = User.create!(first_name: <YOUR NAME>, last_name: <YOUR NAME>, email: <YOUR EMAIL>)
u.addresses.create!(street: <YOUR STREET>, city: <YOUR CITY>, state: <YOUR STATE ABBREVIATION>, zip_code: <YOUR ZIP CODE>)
```


can be called from the console:

```
address = Address.first

UspsVerifyOrganizer.call(address: address)
```

