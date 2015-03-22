module JavaBytecode
  class Modifiers

    PUBLIC    = 0x0001
    PRIVATE   = 0x0002
    PROTECTED = 0x0004
    STATIC    = 0x0008

    attr_accessor :bitset

    def initialize(bitset = 0)
      @bitset = bitset
    end

    def public?
      (bitset & PUBLIC) != 0
    end

    def public=(val)
      if val
        bitset |= PUBLIC
      else
        bitset &= ~PUBLIC
      end
    end

    def private?
      (bitset & PRIVATE) != 0
    end

    def private=(val)
      if val
        bitset |= PRIVATE
      else
        bitset &= ~PRIVATE
      end
    end

    def protected?
      (bitset & PROTECTED) != 0
    end

    def protected=(val)
      if val
        bitset |= PROTECTED
      else
        bitset &= ~PROTECTED
      end
    end

    def static?
      (bitset & STATIC) != 0
    end

    def static=(val)
      if val
        bitset |= STATIC
      else
        bitset &= ~STATIC
      end
    end

  end
end
