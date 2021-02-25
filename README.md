# Attribool
> THIS IS STILL A WORK IN PROGRESS. Everything works, but not everything is
> documented.

Ruby macros for creating boolean methods for attributes that may or may not be
booleans themselves. This is done via coercion based on truthiness. For example,
if you have an attribute of `@name`, and you want to know if `@name` is not
`nil`, you can declare `bool_reader :name`, which will define the method
`name?`. This method will return true if `@name` is truthy.

The `bool_reader` also comes with some handy options. For example, you can
[define a method name](#a-bool_reader-with-method-name-or-prefix) that makes
more sense.  Using the same example, as above, if your attribute is `@name`, but
you'd like for your boolean method to be called `named?`, you can use
`bool_reader :name, method: :named?`.
[Conditionals](#a-bool_reader-with-method-name-and-conditional) can also be set
with lambdas via the `condition:` keyword argument.

Macros also exist for `bool_writer` and `bool_accessor`. When a writer
method is defined, the value will always be coerced into a boolean before
setting the attribute.

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
  include Attribool

  attr_accessor :name
  bool_reader :name
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

#### A bool_reader with method name or prefix
```ruby
require 'attribool'

class Person
  include Attribool

  attr_accessor :name
  bool_reader :name, method: :named?
  bool_reader :name, prefix: :has?
end

person = Person.new
person.named?
person.has_name?
# false, because @name is nil.

person.name = 'John Smith'
person.named?
person.has_name?
# true, because @name is truthy.
```

#### A bool_reader with method name and conditional
```ruby
require 'attribool'

class Person
  include Attribool

  attr_accessor :age
  # In the condition lambdas, the argument refers to the attribute's value.
  bool_reader :age, method: :adult?, condition: ->(a) { a.to_i >= 18 }
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

#### Standard bool_accessor
```ruby
require 'attribool'

class Person
  include Attribool

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

## Reporting Bugs and Requesting Features
If you have an idea or find a bug, please [create an
issue](https://github.com/evanthegrayt/attribool/issues/new). Just make sure
the topic doesn't already exist. Better yet, you can always submit a Pull
Request.

## Self-Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the repository](https://github.com/evanthegrayt/attribool)
if you like it! If you love it, follow me [on
Github](https://github.com/evanthegrayt)!
