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
Prtscr.get(url: 'https://google.com/',width: 1280, height: 1024, scale: 250, key: 'YOUR_KEY_HERE', secret: 'YOUR_SECRET_HERE')
```

And get something like:

```
https://prtscr.ru/v1/1280x1024/250/jpg/1484087718/AIQACodQ/25dcf97122650b5c5282e5e7ab3539a1/https%3A%2F%2Fgoogle.com
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vickodin/prtscr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
