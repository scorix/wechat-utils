# Wechat::Utils

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wechat-utils', github: "scorix/wechat-utils"
```

And then execute:

    $ bundle

## Usage

### 素材管理

#### [获取临时素材](http://mp.weixin.qq.com/wiki/12/473e65b6cf60c5fbb0e02349031bf05c.html)

```
f = Wechat::Utils::File.new
# `data` is the content of the media
data = f.download(access_token, media_id)
```

#### [新增临时素材](http://mp.weixin.qq.com/wiki/4/e3427b8e5bd66cfad337af43c8875f14.html)

```
f = Wechat::Utils::File.new
file = ::File.new("path/to/file")
f.upload_voice(access_token, file)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scorix/wechat-utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

