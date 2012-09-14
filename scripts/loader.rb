require 'sqlite3'

db_file = "quran.sqlite"
db = SQLite3::Database.new(db_file)

create_sql = "create table ayaat (ayat text, good integer)"
insert_sql = "insert into ayaat (ayat, good) values (?, ?)"

db.execute("drop table ayaat")
db.execute(create_sql)

source_file = "quran-uthmani.txt"

File.open(source_file) do |file|
  file.each do |line|
    db.execute(insert_sql, line.chomp, -1) unless (line =~ /^\s+$/ || line =~ /#/)
  end
end

