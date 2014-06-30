require 'spec_helper'

describe BrightCloud::CategoryFinder, :vcr do
  it 'returns categories for a domain' do
    finder = BrightCloud::CategoryFinder.new 'perch.co'
    categories = finder.categories

    expect(categories).to_not be_empty
  end

  it 'returns all categories' do
    categories = BrightCloud::CategoryFinder.all_categories
    expect(categories).to_not be_empty
  end
end
