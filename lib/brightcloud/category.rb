module BrightCloud
  class Category
    attr_reader :id, :name, :group

    def initialize(id, name, group)
      @id = id
      @name = name
      @group = group
    end
  end
end
