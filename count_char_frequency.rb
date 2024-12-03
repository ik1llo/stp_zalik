def count_char_frequency(file_path)
  unless File.exist?(file_path)
    puts "file not found: #{ file_path }"
    return nil 
  end

  text = File.read(file_path)

  frequency = Hash.new(0)
  text.each_char { |char| frequency[char] += 1 }

  frequency
end