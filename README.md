# kuruma-pro-ruby

## Install

```
$ gem install kuruma-pro
```

## Usage

```ruby
require 'kuruma-pro'

client = KurumaPro::Client.new(api_key: "YOUR API KEY")
result = client.get_items(shop_id: 'YOUR SHOP ID')
result.data[:items].each do |item|
  puts item[:id]
end
```

## More Documents

*COMMING SOON*
