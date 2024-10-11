# Cmdlet Usage Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Available Cmdlets](#available-cmdlets)
   - [Array Operations](#array-operations)
     - [Join](#join)
     - [JoinPost](#joinpost)
     - [JoinPre](#joinpre)
   - [Case Transformations](#case-transformations)
   - [Comparison Operations](#comparison-operations)
   - [Inflection Operations](#inflection-operations)
   - [Miscellaneous Operations](#miscellaneous-operations)
   - [String Operations](#string-operations)
5. [Examples](#examples)
6. [Advanced Usage](#advanced-usage)
7. [Troubleshooting](#troubleshooting)
8. [Contributing](#contributing)

## Introduction
Briefly explain what Cmdlet is and its main purpose.

## Installation
Provide instructions on how to install the Cmdlet gem.

## Configuration
Explain how to configure Cmdlet using the `KConfig::Configuration` system.

Example:

```ruby
KConfig.configure do |config|
  config.cmdlet.padl_count = 20
  config.cmdlet.padl_char = '-'
  # Add other configuration options
end
```

## Available Cmdlets

### Array Operations
- Join
- JoinPost
- JoinPre

### Case Transformations
- BackSlash
- Camel
- Constant
- Dash
- Dot
- DoubleColon
- Human
- Lamel
- Lower
- Slash
- Snake
- Title
- Upper

### Comparison Operations
- And
- Default
- Eq
- Gt
- Gte
- Lt
- Lte
- Ne
- Or

### Inflection Operations
- Ordinal
- Ordinalize
- Pluralize
- PluralizeNumber
- PluralizeNumberWord
- Singularize

### Miscellaneous Operations
- FormatJson
- Safe

### String Operations
- Padl
- Padr

## Examples
Provide usage examples for each category of cmdlets.

Example for FormatJson:

```ruby
require 'cmdlet'

data = { name: "John Doe", age: 30 }
formatted_json = Cmdlet::Misc::FormatJson.new.call(data)
puts formatted_json
```

## Cmdlet Examples

### Array Operations

#### Join

```ruby
join = Cmdlet::Array::Join.new
join.call([1, 2, 3])                # Output: "1,2,3"
join.call(%w[a b c], ' | ')         # Output: "a | b | c"
```

#### JoinPost

```ruby
join_post = Cmdlet::Array::JoinPost.new
join_post.call([1, 2, 3])           # Output: "1,2,3,"
join_post.call(%w[a b c], ' | ')    # Output: "a | b | c | "
```

#### JoinPre

```ruby
join_pre = Cmdlet::Array::JoinPre.new
join_pre.call([1, 2, 3])           # Output: ",1,2,3"
join_pre.call(%w[a b c], ' | ')    # Output: " | a | b | c"
```

### Case Transformations

#### BackSlash

```ruby
back_slash = Cmdlet::Case::BackSlash.new
back_slash.call('the quick brown fox')  # Output: "the\quick\brown\fox"
back_slash.call('Twenty Five 66')       # Output: "Twenty\Five66"
```

#### Camel

```ruby
camel = Cmdlet::Case::Camel.new
camel.call('the quick brown fox')   # Output: "TheQuickBrownFox"
camel.call('twenty five 66')        # Output: "TwentyFive66"
camel.call('p02_ef4')               # Output: "P02Ef4"
```

#### Constant

```ruby
constant = Cmdlet::Case::Constant.new
constant.call('the quick brown fox')  # Output: "THE_QUICK_BROWN_FOX"
constant.call('twenty five66')        # Output: "TWENTY_FIVE66"
```

#### Dash

```ruby
dash = Cmdlet::Case::Dash.new
dash.call('The Quick Brown Fox')    # Output: "the-quick-brown-fox"
dash.call('Twenty Five66')          # Output: "twenty-five66"
```

#### Dot

```ruby
dot = Cmdlet::Case::Dot.new
dot.call('the quick brown fox')     # Output: "the.quick.brown.fox"
dot.call('twenty five 66')          # Output: "twenty.five66"
```

#### DoubleColon

```ruby
double_colon = Cmdlet::Case::DoubleColon.new
double_colon.call('the quick brown fox')    # Output: "the::quick::brown::fox"
double_colon.call('Twenty Five 66')         # Output: "Twenty::Five66"
```

#### Human

```ruby
human = Cmdlet::Case::Human.new
human.call('the Quick brown Fox')   # Output: "The quick brown fox"
human.call('twenty five66')         # Output: "Twenty five66"
```

#### Lamel

```ruby
lamel = Cmdlet::Case::Lamel.new
lamel.call('The quick brown fox')   # Output: "theQuickBrownFox"
lamel.call('twenty five66')         # Output: "twentyFive66"
```

#### Lower

```ruby
lower = Cmdlet::Case::Lower.new
lower.call('The Quick Brown Fox')   # Output: "the quick brown fox"
```

#### Slash

```ruby
slash = Cmdlet::Case::Slash.new
slash.call('the quick brown fox')   # Output: "the/quick/brown/fox"
slash.call('twenty Five66')         # Output: "twenty/Five66"
```

#### Snake

```ruby
snake = Cmdlet::Case::Snake.new
snake.call('the Quick brown Fox')   # Output: "the_quick_brown_fox"
snake.call('twenty five66')         # Output: "twenty_five66"
```

#### Title

```ruby
title = Cmdlet::Case::Title.new
title.call('the quick brown fox jumped over the lazy dog')   # Output: "The Quick Brown Fox Jumped Over The Lazy Dog"
title.call('twenty five66')                                  # Output: "Twenty Five66"
```

#### Upper

```ruby
upper = Cmdlet::Case::Upper.new
upper.call('the quick brown fox')   # Output: "THE QUICK BROWN FOX"
```

### Comparison Operations

#### And

```ruby
and_op = Cmdlet::Comparison::And.new
and_op.call(true, true)    # Output: true
and_op.call(true, false)   # Output: false
and_op.call(false, true)   # Output: false
and_op.call(false, false)  # Output: false
```

#### Default

```ruby
default = Cmdlet::Comparison::Default.new
default.call(nil, 'default value')     # Output: "default value"
default.call('existing value', 'default value')  # Output: "existing value"
```

#### Eq (Equal)

```ruby
eq = Cmdlet::Comparison::Eq.new
eq.call(5, 5)    # Output: true
eq.call(5, '5')  # Output: false
eq.call('a', 'a')  # Output: true
```

#### Gt (Greater Than)

```ruby
gt = Cmdlet::Comparison::Gt.new
gt.call(10, 5)   # Output: true
gt.call(5, 10)   # Output: false
gt.call(5, 5)    # Output: false
```

#### Gte (Greater Than or Equal)

```ruby
gte = Cmdlet::Comparison::Gte.new
gte.call(10, 5)  # Output: true
gte.call(5, 5)   # Output: true
gte.call(5, 10)  # Output: false
```

#### Lt (Less Than)

```ruby
lt = Cmdlet::Comparison::Lt.new
lt.call(5, 10)   # Output: true
lt.call(10, 5)   # Output: false
lt.call(5, 5)    # Output: false
```

#### Lte (Less Than or Equal)

```ruby
lte = Cmdlet::Comparison::Lte.new
lte.call(5, 10)  # Output: true
lte.call(5, 5)   # Output: true
lte.call(10, 5)  # Output: false
```

#### Ne (Not Equal)

```ruby
ne = Cmdlet::Comparison::Ne.new
ne.call(5, 10)   # Output: true
ne.call(5, 5)    # Output: false
ne.call('a', 'b')  # Output: true
```

#### Or

```ruby
or_op = Cmdlet::Comparison::Or.new
or_op.call(true, true)    # Output: true
or_op.call(true, false)   # Output: true
or_op.call(false, true)   # Output: true
or_op.call(false, false)  # Output: false
```

### Inflection Operations

#### Ordinal

```ruby
ordinal = Cmdlet::Inflection::Ordinal.new
ordinal.call(1)    # Output: "st"
ordinal.call(2)    # Output: "nd"
ordinal.call(3)    # Output: "rd"
ordinal.call(4)    # Output: "th"
ordinal.call(11)   # Output: "th"
ordinal.call(21)   # Output: "st"
```

#### Ordinalize

```ruby
ordinalize = Cmdlet::Inflection::Ordinalize.new
ordinalize.call(1)    # Output: "1st"
ordinalize.call(2)    # Output: "2nd"
ordinalize.call(3)    # Output: "3rd"
ordinalize.call(4)    # Output: "4th"
ordinalize.call(11)   # Output: "11th"
ordinalize.call(21)   # Output: "21st"
```

#### Pluralize

```ruby
pluralize = Cmdlet::Inflection::Pluralize.new
pluralize.call('book')     # Output: "books"
pluralize.call('child')    # Output: "children"
pluralize.call('sheep')    # Output: "sheep"
pluralize.call('octopus')  # Output: "octopi"
```

#### PluralizeNumber

```ruby
pluralize_number = Cmdlet::Inflection::PluralizeNumber.new
pluralize_number.call('book', 1)     # Output: "book"
pluralize_number.call('book', 2)     # Output: "books"
pluralize_number.call('child', 3)    # Output: "children"
```

#### PluralizeNumberWord

```ruby
pluralize_number_word = Cmdlet::Inflection::PluralizeNumberWord.new
pluralize_number_word.call('book', 1)     # Output: "1 book"
pluralize_number_word.call('book', 2)     # Output: "2 books"
pluralize_number_word.call('child', 3)    # Output: "3 children"
```

#### Singularize

```ruby
singularize = Cmdlet::Inflection::Singularize.new
singularize.call('books')     # Output: "book"
singularize.call('children')  # Output: "child"
singularize.call('sheep')     # Output: "sheep"
singularize.call('octopi')    # Output: "octopus"
```

### Miscellaneous Operations

#### FormatJson

```ruby
format_json = Cmdlet::Misc::FormatJson.new
data = { name: "John Doe", age: 30, hobbies: ["reading", "cycling"] }
formatted = format_json.call(data)
puts formatted
# Output:
# {
#   "name": "John Doe",
#   "age": 30,
#   "hobbies": [
#     "reading",
#     "cycling"
#   ]
# }
```

#### Safe

```ruby
safe = Cmdlet::Misc::Safe.new
safe.call(nil)                   # Output: ""
safe.call(nil, default: "N/A")   # Output: "N/A"
safe.call("Hello")               # Output: "Hello"
```

### String Operations

#### Padl

```ruby
padl = Cmdlet::String::Padl.new
padl.call("Hello", 10)           # Output: "     Hello"
padl.call("World", 10, '-')      # Output: "-----World"
```

#### Padr

```ruby
padr = Cmdlet::String::Padr.new
padr.call("Hello", 10)           # Output: "Hello     "
padr.call("World", 10, '-')      # Output: "World-----"
```

These examples demonstrate how to use each of the Inflection, Miscellaneous, and String operations provided by the Cmdlet gem. Each operation is shown with typical use cases to give users a clear understanding of how they function and what output to expect.

## Advanced Usage
Explain any advanced features or techniques for using Cmdlet.

## Troubleshooting
List common issues and their solutions.

## Contributing
Provide information on how developers can contribute to the Cmdlet project.