module JavaBytecode

  class InvalidMagicException < StandardError
  end

  module ConstantPool
    class InvalidEntryTag < StandardError
      attr_reader :tag

      def initialize(tag)
        super("Invalid constant pool entry tag: #{tag}")
        @tag = tag
      end
    end
  end

end
