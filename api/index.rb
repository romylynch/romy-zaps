require 'json'
file = File.read("../lib/zapier/zapfile.json")
data_hash = JSON.parse(file)
response = data_hash["zaps"].map do |zap|
  names = zap["nodes"].to_a.map { |node| node[1]["selected_api"] }
  {title: zap["title"], names: names}
end