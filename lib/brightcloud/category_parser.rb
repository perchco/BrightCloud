require 'nokogiri'
require_relative 'category'

module BrightCloud
  class CategoryParser
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def categories
      category_nodes.map do |node|
        attributes = hash_from_node node
        BrightCloud::Category.new attributes['catid'], attributes['catname'], attributes['catgroup']
      end
    end

    def category_ids
      category_nodes.map do |node|
        attributes = hash_from_node node
        attributes['catid']
      end
    end

    private

    def category_nodes
      document = Nokogiri::XML response
      document.xpath '//cat'
    end

    def hash_from_node(node)
      node.children.each_with_object({}){ |object, hash| hash[object.name] = object.text }
    end

  end
end
