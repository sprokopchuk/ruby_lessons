#группировка(дан массив имен-фамилий, написать алгоритм поиска однофамильцев)

class Array

  def search_namesakes
    if self.first.is_a? String
      search_namesakes_iter self.clone
    end
  end

  private
  def search_namesakes_iter arr, pair_arr = [], res_arr = []
    if arr.length > 0
      pair =  arr.first.split(" ")
      arr.delete_at 0
      arr.each_index do |i|
        other_pair = arr[i].split(" ")
        if pair[1] == other_pair[1]
          pair_arr << pair.join(" ") unless pair_arr.include? pair.join(" ")
          pair_arr << other_pair.join(" ")
        end
      end
      arr -= pair_arr
      res_arr << pair_arr unless pair_arr.empty?
      search_namesakes_iter arr, [], res_arr
    else
      res_arr
    end
  end
end