#написать map, select/detect, all?, any?, count, reduce.

class Array
  def my_count
    size = 0
    self.each{ size += 1}
    size
  end

  def my_any? &block
    if block_given?
      self.each do |x|
        return block.call x
      end
    else
      self.length > 0 ? true : false
    end
  end

  def my_all? &block
    if block_given?
      res = true
      self.each do |x|
        res &&=  block.call x
      end
      res
    elsif self.length > 0
      self.each{ |x| return false if x }
    else
      true
    end
  end

  def my_select &block
    if block_given?
      elms = []
      self.each{|x| elms << x if block.call x}
      elms
    else
      self.to_enum
    end
  end
end