class IO
  def read_num(size)
    num  = 0
    data = read(size).bytes
    data.each_with_index do |x, i|
      num |= x << ((data.length - i - 1) * 8)
    end

    num
  end

  def read_bytes(size)
    read(size).bytes
  end
end
