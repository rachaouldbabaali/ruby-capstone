class ListData
  def list(index, data)
    print "#{index + 1}) "
    data.each { |key, value| print "#{key}: #{value}  \t" unless value.nil? }
    puts
  end

  def get_properties(item, index, prop_names, props)
    hash = {
      'ID' => item.id,
      'Game Name' => item.title # Add the game title attribute
    }
    hash['Author'] = "#{item.author.first_name} #{item.author.last_name}" if item.author

    props.each_with_index { |prop, id| hash[prop_names[id]] = prop }

    list(index, hash)
  end
end
