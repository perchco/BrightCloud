require_relative 'base'

module BrightCloud
  module Requests
    class DomainRequest
      include Requests::Base

      DOMAIN_CATEGORY_ENDPOINT = "http://thor.brightcloud.com/rest/uris/"

      def endpoint(options = {})
        domain = options[:domain]
        "#{DOMAIN_CATEGORY_ENDPOINT}#{domain}"
      end
    end
  end
end
