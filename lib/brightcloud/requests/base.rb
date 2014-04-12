require_relative '../../brightcloud'
require 'oauth'
require 'oauth/consumer'

module BrightCloud
  module Requests
    module Base

      attr_reader :consumer, :token

      def initialize
        @consumer = OAuth::Consumer.new(BrightCloud.key, BrightCloud.secret)
        @token = OAuth::Token.new('', '')
      end

      def get(options={}, &block)
        request(options) do |response|
          return block.call(response) if block
          return response.body
        end
      end

      protected

      def request(options, &block)
        request_uri = create_request_uri(options)
        req = create_request(request_uri.path)
        http = Net::HTTP.new(request_uri.host, request_uri.port)

        req.oauth!(http, consumer, token, :scheme => 'query_string')

        response = http.request(req)

        return block.call(response)
      end

      def create_request(path)
        Net::HTTP::Get.new(path)
      end

      def create_request_uri(options)
        URI.parse(URI.escape(endpoint(options)))
      end

    end
  end
end
