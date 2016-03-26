# Cliches: Easily set up attributes for your tests.

## What is this?

Cliches solves the endless problem of having to pass a large list
of attributes to different methods. This is a problem that constantly 
appears when writing tests, a problem that people either solve at the 
wrong level or they don't solve at all.


## Installation

Add this line to your application's Gemfile:

    gem 'cliches'

And then execute:

    $ bundle


## Usage

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

Or like this to not create:
```
Customer.new(cliches(:customer))
```

But also like this:
```ruby
customer.update_attributes(cliches(:customer))
```

And like this:
```ruby
post :create, {customer: cliches(:customer)}
```


## Rails Goodies
There are a couple of things that cliches provide to Rails users to
keep their syntax sugar-levels at acceptable levels.
 
There is a shortcut for building models:

```ruby
# This looks up cliches(:customer) and instantiates a model.
Customer.cliche
 
# This looks up cliches(:returning_customer) and instantiates
Customer.cliche(:returning)

# This looks does the same, but also saves the model
Customer.cliche!(:returning)
```

The Rails integration also comes with a simple little generator that
 you can use to create cliche files. Here's an example of how to run it:

    $ bin/rails g cliche customers
    
This will generate a file called test/cliches/customers.rb and populate
it with a simple example of how to use cliche.

## Rationale

In Rails, for example, you often rely on fixtures or factories to help 
you create data. 

Fixtures can be brittle and force you to create lots of records just 
to cover the variations in your data. But they are very fast compared
to records. And who doesn't like fast?
 
Factories, on the other hand, allow you to build objects that don't
get persisted, which is great because you often don't need stuff to be
persisted. They also let you write Ruby, which you know you want to do.
But the cost you pay is that you get hooked on describing large
hierarchies of objects and, when you do need to persist those hierarchies, 
things become really slow.

But there's one bigger issue with both of these approaches. In both 
cases, the blueprints for your data are held captive by the tool that
you define them with. What if you want to test the create method in
a controller? 

Well, maybe you should grab one of your fixtures and fiddle with its
attributes a little, just be sure to remove the id attribute and change
any attributes with unique constraints. Or maybe you should instantiate
a new model with all of the associations that entails just to get its
list of attributes.

No you shouldn't. You shouldn't have to do either of those things.
All of these problems are, in fact, one and the same problem. You need
predefined sets of attributes that you'll be passing along to a bunch
 of different methods. That's what you really want and that's what 
 cliches gives you.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/cliches/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
