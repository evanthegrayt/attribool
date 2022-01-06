# Attribool
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fevanthegrayt%2Fattribool%2Fbadge%3Fref%3Dmaster&style=flat)](https://actions-badge.atrox.dev/evanthegrayt/attribool/goto?ref=master)
[![Gem Version](https://badge.fury.io/rb/attribool.svg)](https://badge.fury.io/rb/attribool)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Ruby macros for creating boolean methods for attributes that may or may not be
booleans themselves. This is done via coercion based on truthiness.

For example, if you have an attribute of `@name`, and you want to know if
`@name` is not `nil`, you can declare `bool_reader :name`, which will define the
method `name?`. This method will return true if `@name` is truthy.

The `bool_reader` also comes with some handy options. For example, you can
[define a method name](#a-bool_reader-with-method-name) that makes
more sense. Using the same example as above, if your attribute is `@name`, but
you'd like for your boolean method to be called `named?`, you can use
`bool_reader :name, method_name: :named?`.
[Conditionals](#a-bool_reader-with-method-name-and-conditional) can also be set
with lambdas via the `condition:` keyword argument.

The first argument is always the instance variable to check for truthiness.
Because of this, it is also valid syntax to use `bool_reader :@name`, if it
makes more sense to you.

Macros also exist for `bool_writer` and `bool_accessor`. When a writer
method is defined, the value will always be coerced into a boolean before
setting the attribute.

You can read the documentation [here](https://evanthegrayt.github.io/attribool/).

## Installation
#### Via Gemfile
```ruby
gem 'attribool'
```

#### Via rubygems
```sh
gem install attribool
```

#### From source
```sh
git clone https://github.com/evanthegrayt/attribool.git
cd attribool
bundle exec rake install
```

## Examples
#### Standard bool_reader
```ruby
require 'attribool'

class Person
  extend Attribool

  attr_accessor :name
  bool_reader :name
  # OR
  # bool_reader :@name
  # bool_reader 'name'
  # bool_reader '@name'
end

person = Person.new
person.name?
# false, because @name is nil.

person.name = 'John Smith'
person.name
# "John Smith"
person.name?
# true, because @name is truthy.
```

#### A bool_reader with method name
```ruby
require 'attribool'

class Person
  extend Attribool

  attr_accessor :name
  bool_reader :name, method_name: :named?
end

person = Person.new
person.named?
# false, because @name is nil.

person.name = 'John Smith'
person.named?
# true, because @name is truthy.
```

#### A bool_reader with method name and conditional
```ruby
require 'attribool'

class Person
  extend Attribool

  attr_accessor :age
  # In the condition lambdas, the argument refers to the attribute's value.
  bool_reader :age, method_name: :adult?, condition: ->(a) { a.to_i >= 18 }
end

person = Person.new
person.adult?
# false, because @age is nil, which the to_i converts to 0.

person.age = 10
person.adult?
# false, because @age is less than 18.

person.age = 20
person.adult?
# true, because @age is greater than 18.
```

#### Assigning more than one bool_reader with a method name at once
```ruby
require 'attribool'

class Person
  extend Attribool

  attr_accessor :name, :age
  # When creating multiple readers at once, if you want to specify a
  # method_name, you must provide a Proc as the argument, where the attribute
  # name is the argument.
  bool_reader :age, :name, method_name: ->(m) { "has_#{m}?" }
end

person = Person.new
person.has_age?
person.has_name?
# Both false, because @age and @name are nil.

person.age = 10
person.has_age?
# true, because @age is not nil.

person.name = 'Bob'
person.has_name?
# true, because @name is not nil.
```

#### Standard bool_accessor
```ruby
require 'attribool'

class Person
  extend Attribool

  bool_accessor :living
end

person = Person.new
person.living?
# false, because @living is nil.

person.living = true
person.living?
# true, because @living is true.
# Be aware -- if you pass anything truthy, it will be coerced to true!
```

#### Standard bool_writer
In most cases where you'd use a `bool_writer`, you'd probably want to just use
`bool_accessor`. This example is to show that, even when using `bool_accessor`,
the value is coerced to a boolean when the value is set by `bool_writer`.
```ruby
require 'attribool'

class Person
  extend Attribool

  attr_reader :living
  bool_writer :living
end

person = Person.new
person.living
# nil

person.living = 'blah'
person.living
# true, because 'blah' was coerced into a boolean because strings are truthy.
```

## Reporting Bugs and Requesting Features
If you have an idea or find a bug, please [create an
issue](https://github.com/evanthegrayt/attribool/issues/new). Just make sure
the topic doesn't already exist. Better yet, you can always submit a Pull
Request.

## Self-Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the repository](https://github.com/evanthegrayt/attribool)
if you like it! If you love it, follow me [on
GitHub](https://github.com/evanthegrayt)!
