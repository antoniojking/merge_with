class Merge
  def self.merge_with(hash1, hash2)
    new_hash = {}
    all_keys = (hash1.keys + hash2.keys).uniq

    all_keys.each do |key|
      if hash1.keys.include?(key) && hash2.keys.include?(key)
        new_hash[key] = yield(hash1[key], hash2[key])
      elsif hash1.keys.include?(key)
        new_hash[key] = hash1[key]
      else hash2.keys.include?(key)
        new_hash[key] = hash2[key]
      end
    end

    new_hash
  end
end
