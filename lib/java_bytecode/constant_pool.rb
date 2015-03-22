module JavaBytecode
  module ConstantPool

    module Tag
      CONSTANT_Class              = 7
      CONSTANT_Fieldref           = 9
      CONSTANT_Methodref          = 10
      CONSTANT_InterfaceMethodref = 11
      CONSTANT_String             = 8
      CONSTANT_Integer            = 3
      CONSTANT_Float              = 4
      CONSTANT_Long               = 5
      CONSTANT_Double             = 6
      CONSTANT_NameAndType        = 12
      CONSTANT_Utf8               = 1
      CONSTANT_MethodHandle       = 15
      CONSTANT_MethodType         = 16
      CONSTANT_InvokeDynamic      = 18
    end

    def self.create_entry(io)
      tag = io.read_num(1)

      case tag
      when Tag::CONSTANT_Class
        ClassEntry.new(io.read_num(2))
      
      when Tag::CONSTANT_Fieldref
        FieldrefEntry.new(io.read_num(2), io.read_num(2))

      when Tag::CONSTANT_Methodref
        MethodrefEntry.new(io.read_num(2), io.read_num(2))

      when Tag::CONSTANT_InterfaceMethodref
        InterfaceMethodrefEntry.new(io.read_num(2), io.read_num(2))

      when Tag::CONSTANT_String
        StringEntry.new(io.read_num(2))

      when Tag::CONSTANT_Integer
        IntegerEntry.new(io.read_bytes(4))

      when Tag::CONSTANT_Float
        FloatEntry.new(io.read_bytes(4))

      when Tag::CONSTANT_Long
        LongEntry.new(io.read_bytes(4), io.read_bytes(4))

      when Tag::CONSTANT_Double
        DoubleEntry.new(io.read_bytes(4), io.read_bytes(4))
      
      when Tag::CONSTANT_NameAndType
        NameAndTypeEntry.new(io.read_num(2), io.read_num(2))

      when Tag::CONSTANT_Utf8
        length = io.read_num(2)
        Utf8Entry.new(length, io.read_bytes(length))

      when Tag::CONSTANT_MethodHandle
        MethodHandleEntry.new(io.read_num(1), io.read_num(2))

      when Tag::CONSTANT_InvokeDynamic
        InvokeDynamicEntry.new(io.read_num(2), io.read_num(2))

      else
        raise InvalidEntryTag.new(tag)
      end
    end

    class Entry
      attr_reader :tag

      def initialize(tag)
        @tag = tag
      end
    end

    class ClassEntry < Entry
      attr_reader :name_index

      def initialize(name_index)
        super(Tag::CONSTANT_Class)
        @name_index = name_index
      end
    end

    class FieldrefEntry < Entry
      attr_reader :class_index, :name_and_type_index

      def initialize(class_index, name_and_type_index)
        super(Tag::CONSTANT_Fieldref)
        @class_index = class_index
        @name_and_type_index = name_and_type_index
      end
    end

    class MethodrefEntry < Entry
      attr_reader :class_index, :name_and_type_index

      def initialize(class_index, name_and_type_index)
        super(Tag::CONSTANT_Methodref)
        @class_index = class_index
        @name_and_type_index = name_and_type_index
      end
    end

    class InterfaceMethodrefEntry < Entry
      attr_reader :class_index, :name_and_type_index

      def initialize(class_index, name_and_type_index)
        super(Tag::CONSTANT_InterfaceMethodref)
        @class_index = class_index
        @name_and_type_index = name_and_type_index
      end
    end

    class StringEntry < Entry
      attr_reader :string_index

      def initialize(string_index)
        super(Tag::CONSTANT_String)
        @string_index = string_index
      end
    end

    class IntegerEntry < Entry
      attr_reader :bytes

      def initialize(bytes)
        super(Tag::CONSTANT_Integer)
        @bytes = bytes
      end
    end

    class FloatEntry < Entry
      attr_reader :bytes

      def initialize(bytes)
        super(Tag::CONSTANT_Float)
        @bytes = bytes
      end
    end

    class LongEntry < Entry
      attr_reader :high_bytes, :low_bytes

      def initialize(high_bytes, low_bytes)
        super(Tag::CONSTANT_Long)
        @high_bytes = high_bytes
        @low_bytes = @low_bytes
      end
    end

    class DoubleEntry < Entry
      attr_reader :high_bytes, :low_bytes

      def initialize(high_bytes, low_bytes)
        super(Tag::CONSTANT_Double)
        @high_bytes = high_bytes
        @low_bytes = @low_bytes
      end
    end

    class NameAndTypeEntry < Entry
      attr_reader :name_index, :descriptor_index

      def initialize(name_index, descriptor_index)
        super(Tag::CONSTANT_NameAndType)
        @name_index = name_index
        @descriptor_index = descriptor_index
      end
    end

    class Utf8Entry < Entry
      attr_reader :length, :bytes, :string

      def initialize(length, bytes)
        super(Tag::CONSTANT_Utf8)
        @length = length
        @bytes  = bytes
        @string = bytes.pack('U*')
      end
    end

    class MethodHandleEntry < Entry
      attr_reader :reference_kind, :reference_index

      def initialize(reference_kind, reference_index)
        super(Tag::CONSTANT_MethodHandle)
        @reference_kind = reference_kind
        @reference_index = reference_index
      end
    end

    class InvokeDynamicEntry < Entry
      attr_reader :bootstrap_method_attr_index,
                  :name_and_type_index

      def initialize(bootstrap_method_attr_index, name_and_type_index)
        super(Tag::CONSTANT_InvokeDynamic)
        @bootstrap_method_attr_index = bootstrap_method_attr_index
        @name_and_type_index = name_and_type_index
      end
    end
  end
end
