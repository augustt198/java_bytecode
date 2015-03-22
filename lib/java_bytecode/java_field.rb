module JavaBytecode
  class FieldInfo

    attr_reader :access_flags,
                :name_index, :descriptor_index,
                :attributes_count, :attributes

    def initialize(io)
      @access_flags = Modifiers.new(io.read_num(2))
      
      @name_index = io.read_num(2)
      @descriptor_index = io.read_num(2)

      @attributes_count = io.read_num(2)
    end
  end
end
