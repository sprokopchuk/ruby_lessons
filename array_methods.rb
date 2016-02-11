#написать map, select/detect, all?, any?, count, reduce.

class Array
  def my_count
    size = 0
    self.each{ size += 1}
    size
  end

  def my_any?
    res = false
    self.each do |x|
      res ||= yield x
    end
    res
  end

  def my_all?
    res = true
    self.each do |x|
      if block_given?
        res &&=  yield x
      else
        res &&= false unless x
      end
    end
    res
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

  def my_map &block
    if block_given?
      elms = []
      self.each {|x| elms << block.call(x)}
      elms
    else
      self.to_enum
    end
  end

  def my_reduce *args, &block
    case args.length
      when 0
        if block_given?
          memo = self[0]
          self.each_index {|i| memo = block.call(memo, self[i]) unless i == 0}
          memo
        end
      when 1
        if block_given?
          memo = args[0]
          self.each_index {|i| memo = block.call(memo, self[i])}
          memo
        else
          res = self[0]
          self.each_index{|i| res = res.send(args[0], self[i]) unless i == 0 }
          res
        end
      when 2
        res = args[0]
        self.each_index{|i| res = res.send(args[1], self[i]) }
        res
    end
  end
end