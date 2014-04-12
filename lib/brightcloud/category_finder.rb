require_relative 'category_parser'
require_relative 'requests/domain_request'
require_relative 'requests/categories_request'

module BrightCloud
  class CategoryFinder

    def self.all_categories
      return @all_categories if @all_categories
      @all_categories = self.all_categories!
    end

    def self.all_categories!
      categories_request = BrightCloud::Requests::CategoriesRequest.new
      categories_request.get do |response|
        parser = BrightCloud::CategoryParser.new response.body
        parser.categories
      end
    end

    def initialize(domain)
      @domain = domain
      @request = BrightCloud::Requests::DomainRequest.new
    end

    def categories
      @request.get(domain: @domain) do |response|
        parser = BrightCloud::CategoryParser.new response.body
        categories_with_ids parser.category_ids
      end
    end

    private

    def categories_with_ids(ids)
      self.class.all_categories.select do |category|
        ids.include? category.id
      end
    end

  end
end
