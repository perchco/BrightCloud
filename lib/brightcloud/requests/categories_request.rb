require_relative 'base'

module BrightCloud
  module Requests
    class CategoriesRequest
      include Requests::Base

      def endpoint(options = {})
        "http://thor.brightcloud.com/rest/uris/categories"
      end
    end
  end
end
