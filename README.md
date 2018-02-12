# kuruma-pro-client-ruby
----

## Install

*COMMING SOON*

## Usage

```ruby
require ''

client = KurumaPro::Client.new(api_key: "YOUR API KEY")
result = client.get_items(shop_id: 'YOUR SHOP ID')
result.data[:items].each do |item|
  puts item[:id]
end
```

## More Documents

*COMMING SOON*
