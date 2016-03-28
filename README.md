# Cliches: Rid your tests of boring, repetitive hashes.

## What is this?

Cliches solves the endless problem of having to pass large hashes of 
parameters to different methods in your tests. This is a problem that
constantly appears when writing tests, a problem that people either 
solve at the wrong level or don't solve at all.

## Installation

Add this line to your application's Gemfile:

    gem 'cliches'

And then run:

    $ bundle

## Why should I use this? 

You may be thinking that fixtures of factories already solve this 
problem. Well, they do, but only partly. Both of these solutions will 
couple your attributes with ActiveRecord models, which really isn't 
what you want. Consider these scenarios:

1. You are writing an integration test. How can you easily get the
attributes from a factory/fixture and just use them to do a POST?
2. You want to use the attributes from one factory to update an 
existing record. How do you do that without instantiating a record
and potentially getting a lot of attributes you're not interested in.
3. You have a method that takes a hash but has nothing to do with 
ActiveRecord. You will be calling this method with very similar 
arguments from many different tests. How do you keep these similar 
attributes organized?


## OK. What does this look like?

cliches are defined in your test directory, in plain Ruby files that
look like this:

```ruby
Cliches.define(:customer).as(
  first_name: "Alice",
  last_name: "Wilson",
  state: "AL",
  country: "US"
)
```

That's it; easy-peasy. Their basic usage looks like this:

```ruby
Customer.create!(cliches(:customer))
```

Or like this to just instantiate:
```
Customer.new(cliches(:customer))
```

But you can also do this:
```ruby
customer.update_attributes(cliches(:customer))
```

And even this:
```ruby
post :create, {customer: cliches(:customer)}
```


## Rails Goodies
There are a couple of things that the cliches gems provide to Rails
developers to keep their syntax sugar-levels adequately high.
 
There is a shortcut for building models:

```ruby
# This looks up cliches(:customer) and instantiates a model.
Customer.cliche
 
# This looks up cliches(:returning_customer) and instantiates a model
Customer.cliche(:returning)

# This does the same, but also saves the model
Customer.cliche!(:returning)
```

The Rails integration also comes with a simple little generator that
 you can use to create cliche files. Here's an example of how to run it:

    $ bin/rails g cliches:new customer
    
This will generate a file called test/cliches/customer.rb and populate
it with a simple example of how to use cliche.

## Contributing

1. Fork it ( https://github.com/thegengen/cliches/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
