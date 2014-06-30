require_relative '../lib/brightcloud'
require 'dotenv'
require 'rspec'
require 'vcr'

Dotenv.load

BrightCloud.configure do |b|
  b.key = ENV['BRIGHTCLOUD_KEY']
  b.secret = ENV['BRIGHTCLOUD_SECRET']
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  c.filter_sensitive_data('<BRIGHTCLOUD_KEY>') { ENV['BRIGHTCLOUD_KEY'] }
  c.filter_sensitive_data('<BRIGHTCLOUD_SECRET>') { ENV['BRIGHTCLOUD_SECRET'] }

  without_oauth = VCR.request_matchers.uri_without_param(:oauth_timestamp, :oauth_nonce, :oauth_signature)

  c.default_cassette_options = {
    :match_requests_on => [:method, without_oauth]
  }
end
