=begin
Сортировка массива: чет/нечет, обратный порядок, массив строк упорядочить по
длине слов (группировка по длине слов)
=end
class Array
  def my_sort_by_even
    even_nums, odd_nums = [], []
    self.each{|x| x.even? ? even_nums << x : odd_nums << x }
    even_nums + odd_nums
  end

  def my_reverse
    elms = []
    self.each_index do |i|
      elms[(self.size - 1) - i] = self[i]
    end
    elms
  end

  def my_sort_by_length
    elms = []
    copy_arr = self.clone
    i = 0
    while i != (self.size) do
      elms << find_max_by_length(copy_arr)
      i += 1
    end
    elms
  end

  private
  def find_max_by_length arr
    return if arr.empty?
    max = ""
    deleted_index = 0
    arr.each_index do |i|
      if max.length < arr[i].length
        max = arr[i]
        deleted_index = i
      end
    end
    arr.slice! deleted_index
    max
  end
end

