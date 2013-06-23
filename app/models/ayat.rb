class Ayat
  attr_accessor :surah_number, :ayat_number, :ayat_text

  def initialize(line)
    @surah_number, @ayat_number, @ayat_text = line.split('|')
  end

  def to_s
    "#{ayat_text}(#{surah_number}:#{ayat_number})"
  end
end
