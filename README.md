# Prtscr.ru API gem

This gem is a lib for [PrtScr.ru](https://prtscr.ru/) API (website screenshot).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prtscr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prtscr

## Usage

run the next line of code:

```ruby
Prtscr.get(url: 'https://duckduckgo.com', width: 1280, height: 1024, scale: 350, key: 'YOUR_KEY_HERE', secret: 'YOUR_SECRET_HERE', format: 'jpg')
```

And get something like:

```
https://prtscr.ru/v3/screenshot.jpg?url=https%3A%2F%2Fduckduckgo.com%2F&key=2gi_io4l&sign=f162b32357ece5f1489352cbb40c9b4d&width=1280&height=1024&scale=350
```

Having previous line, you can use html img tag:

![Google website screenshot](https://prtscr.ru/v3/screenshot.jpg?url=https%3A%2F%2Fduckduckgo.com%2F&key=2gi_io4l&sign=f162b32357ece5f1489352cbb40c9b4d&width=1280&height=1024&scale=350)

### Available options

**url**: URL encoded Address

**width**: Browser width, px

**height**: Browser height, px

**scale**: Screenshot scale for width, px

**key**: Your Key

**secret**: Your Secret

**format**: Screenshot extension

**key** and **secret** options you can obtain at [PrtScr.ru](https://prtscr.ru/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vickodin/prtscr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
