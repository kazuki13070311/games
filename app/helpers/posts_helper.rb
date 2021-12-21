module PostsHelper 
  def posts_name_replacement(name, replacement_word)
    replacement_word.each do |word|
      name.gsub!(word, "?????")
    end
    return name
  end

  def posts_description_replacement(description, replacement_word)
    replacement_word.each do |word|
      description.gsub!(word, "?")
    end
    return description
  end
end
