module JavaBytecode
  class Attribute
    attr_reader :attribute_name_index,
                :attribute_length,
                :info

    def initialize(attribute_name_index, attribute_length, info = [])
      @attribute_name_index = attribute_name_index
      @attribute_length = @attribute_length
      @info = info
    end
  end

end
