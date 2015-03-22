module JavaBytecode
  class JavaClass

    attr_reader :minor_version, :major_version,
                :constant_pool_count, :constant_pool,
                :access_flags,
                :this_class, :super_class,
                :interfaces_count, :interfaces,
                :fields_count

    def initialize(io)
      if io.read_num(4) != 0xCAFEBABE
        raise InvalidMagicException.new(
          'Expected first four bytes to be 0xCAFEBABE'
        )
      end

      @minor_version = io.read_num(2)
      @major_version = io.read_num(2)

      @constant_pool_count = io.read_num(2)

      @constant_pool = Array.new(constant_pool_count - 1) do
        ConstantPool.create_entry(io)
      end

      @access_flags = Modifiers.new(io.read_num(2))
      
      @this_class = io.read_num(2)
      @super_class = io.read_num(2)

      @interfaces_count = io.read_num(2)
      @interfaces = Array.new(interfaces_count) do
        io.read_num(2)
      end

      @fields_count = io.read_num(2)  
    end

  end
end
