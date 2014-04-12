# BrightCloud

A Ruby interface to the BrightCloud API.

## Usage

### Setting Up

Setting up BrightCloud is done via the `configure` method.

```
BrightCloud.configure do |b|                                
  b.key = ENV['BRIGHTCLOUD_KEY']
  b.secret = ENV['BRIGHTCLOUD_SECRET']
end
```

### Typical Usage

The `BrightCloud::CategoryFinder` object is used to determine which categories a URL belongs to.

```
finder = BrightCloud::CategoryFinder.new 'perch.co'
finder.categories # => An array of BrightCloud::Category objects.
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/BrightCloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
