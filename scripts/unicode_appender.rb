output = File.open("new.txt", "w")
File.open("quran-uthmani.txt") do |file|
  file.each do |line|
    o_line = line.chomp
    o_line <<  '&#x06DD' << "\n"
    output.puts o_line
  end
end
output.close
