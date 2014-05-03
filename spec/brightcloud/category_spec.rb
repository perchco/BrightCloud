require 'spec_helper'

describe BrightCloud::Category do

  it 'can be initialized' do
    category = BrightCloud::Category.new '1', 'Name', 'Group'

    expect(category.id).to eq '1'
    expect(category.name).to eq 'Name'
    expect(category.group).to eq 'Group'
  end

end
