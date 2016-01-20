#написать map, select, detect, count, all?, any? через reduce

class Array
  def r_count
    self.reduce(0){|memo| memo += 1}
  end

  def r_any? &block
    self.reduce(false){|memo, obj| memo ||= block.call(obj)}
  end

  def r_all? &block
    self.reduce(true) do |memo, obj|
      if block_given?
        memo &&= block.call(obj)
      else
        obj ? memo &&= true : memo &&= false
      end
    end
  end

  def r_select &block
    if block_given?
      self.reduce([]){|memo, obj| block.call(obj) ? memo << obj : memo }
    else
      self.to_enum
    end
  end

  def r_map &block
    if block_given?
      self.reduce([]){|memo, obj| memo << block.call(obj)}
    else
      self.to_enum
    end
  end

 end