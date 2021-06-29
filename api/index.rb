require 'json'

file = File.read("../lib/zapier/zap_data.json")
data_hash = JSON.parse(file)
response = data_hash["zaps"].map do |zap|
  names = zap["nodes"].to_a.map { |node| node[1]["selected_api"] }
  {title: zap["title"], names: names}
end

Handler = Proc.new do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/text; charset=utf-8'
  res.body = "Current Time: #{Time.new}"
end