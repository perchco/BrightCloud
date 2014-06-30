require 'spec_helper'

describe BrightCloud::Configuration do
  describe 'configuration' do
    it 'allows assignment of attributes' do
      BrightCloud.configure do |bright_cloud|
        bright_cloud.key = 'key'
        bright_cloud.secret = 'secret'
      end

      expect(BrightCloud.key).to eq 'key'
      expect(BrightCloud.secret).to eq 'secret'
    end
  end
end
