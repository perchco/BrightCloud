module BrightCloud
  module Configuration

    attr_accessor :key, :secret

    def configure
      yield self
    end

  end
end
