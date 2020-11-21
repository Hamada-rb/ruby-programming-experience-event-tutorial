require 'csv'

csv = CSV.open("result.csv", "wb", headers: true)

csv << ["名称", "住所", "電話番号"]

CSV.foreach("hamada.csv", headers: true) do |row|
  csv << [row["名称"], row["住所"], row["電話番号"]]
end
