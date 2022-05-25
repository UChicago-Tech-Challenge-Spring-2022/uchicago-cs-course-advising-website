namespace :slurp do
  desc "TODO"
  task courses: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "courses.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Course.new
      t.course_number = row["course"]
      t.keywords = row["keywords"]
      t.satisfaction = row["satisfaction level"]
      t.workload = row["workload (median)"].to_i

      t.save
      puts "#{t.course_number}, #{t.keywords}, #{t.workload} saved"
    end
    puts "There are now #{Course.count} rows in the transactions table"
  end

end
