require "./count_char_frequency"

result = count_char_frequency("input.txt");

sorted_frequency = result.sort_by { |char, count| [-count, char] }
sorted_frequency.each { |char, count| puts "\"#{ char }\" : #{ count }" }