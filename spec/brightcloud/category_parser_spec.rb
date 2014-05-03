require 'spec_helper'

describe BrightCloud::CategoryParser, :vcr do

  before :all do
    VCR.use_cassette('all_categories') do
      categories_request = BrightCloud::Requests::CategoriesRequest.new
      categories_request.get do |response|
        @response = response.body
      end
    end
  end

  it 'returns categories from an HTTP response' do
    parser = BrightCloud::CategoryParser.new @response
    categories = parser.categories

    expect(categories).to_not be_empty
  end

end
