#!/usr/bin/env ruby

require "json"
require "net/http"

current_json = JSON.parse(File.read("versions.json"))
latest_release = current_json.compact.keys.max_by(&:to_f)
donor = current_json[latest_release]

uri = URI("https://cache.ruby-lang.org/pub/ruby/snapshot/snapshot-master.json")
res = Net::HTTP.get_response(uri)
raise StandardError, "Got status code #{res.code}: #{res.body}" unless res.code == "200"

master = JSON.parse(res.body).first
master["url"] = master["filename"].transform_values { |file| "https://cache.ruby-lang.org/pub/ruby/snapshot/#{file}" }
master.delete("filename")
master.merge!({
  "version" => "master",
  "variants" => donor["variants"],
  "rust" => donor["rust"],
  "rustup" => donor["rustup"],
})
result = { "master" => master }.to_json
# For step output
puts result
# For apply-templates.sh
File.write("versions.json", result)
