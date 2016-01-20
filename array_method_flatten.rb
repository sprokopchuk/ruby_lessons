#flatten
class Array
  def my_flatten *args
    args.length > 0 ? my_flatten_iter({level: args[0], m_arr: self.clone, r_arr: []}) : my_flatten_iter({m_arr: self.clone, r_arr: []})
  end


  private
  def my_flatten_iter opts={}
    level = opts[:level]
    m_arr = opts[:m_arr]
    r_arr = opts[:r_arr]
    m_arr.each_index do |i|
      if m_arr[i].is_a? Array
        if level.to_i > 0
          my_flatten_iter m_arr: m_arr[i], r_arr: r_arr, level: (level - 1)
        elsif level.nil?
          my_flatten_iter m_arr: m_arr[i], r_arr: r_arr
        else
          r_arr << m_arr[i]
        end
      else
        r_arr << m_arr[i]
      end
    end
    r_arr
  end
end