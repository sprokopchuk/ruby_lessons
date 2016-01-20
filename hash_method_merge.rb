#hash merge

class Hash
  def my_merge other_hash, &block
    self_hash = self.clone
    if block_given?
      other_hash.each do |k, v|
        if self_hash.has_key? k
          self_hash[k] = block.call(k, self_hash[k], v)
        else
          self_hash[k] = v
        end
      end
    else
      other_hash.each{|k, v| self_hash[k] = v }
    end
    self_hash
  end
end