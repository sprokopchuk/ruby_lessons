#Поиск в массиве: локальные максимумы
=begin
max → obj click to toggle source
max { |a, b| block } → obj
max(n) → obj
max(n) {|a,b| block } → obj
Returns the object in enum with the maximum value. The first form assumes all
objects implement Comparable; the second uses the block to return a <=> b.
=end

class Array
  def my_max *args, &block
    case
      when block_given?
        if args.length > 0
          find_max_elms args[0], &block
        else
          find_max self, &block
        end
      when args.length > 0
        find_max_elms args[0]
      else
        find_max self
    end
  end

  private

  def find_max_elms nums, &block
    elms = []
    copy_arr = self.clone
    nums.times do
      max = find_max copy_arr, &block
      elms << max
      copy_arr.delete(max)
    end
    elms
  end

  def find_max arr, &block
    max = arr.first
    if block_given?
      arr.each{|x| max = x if block.call(max, x) == -1}
    else
      arr.each{|x| max = x if (max <=> x) == -1 }
    end
    max
  end

end