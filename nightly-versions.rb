#!/usr/bin/env ruby

require "json"
require "net/http"

current_json = JSON.parse(File.read("docker-ruby/versions.json"))
latest_release = current_json.compact.keys.max_by(&:to_f)
donor = current_json[latest_release]

# Until irb releases a new version (current 1.15.1)
donor["variants"].delete_if { |v| v.include?("bullseye")  }

uri = URI("https://cache.ruby-lang.org/pub/ruby/snapshot/snapshot-master.json")
res = Net::HTTP.get_response(uri)
raise StandardError, "Got status code #{res.code}: #{res.body}" unless res.code == "200"

upstream = JSON.parse(res.body).first
master = donor.slice("variants", "rust", "rustup")
master.merge!(
  "version" => "master",
  "date" => upstream["date"],
  "url" => { "xz" => "file://#{ENV["GITHUB_WORKSPACE"]}/ruby.tar.xz" },
  "sha256" => { "xz" => upstream["sha256"]["xz"] },
)
result = { "master" => master }.to_json
# For step output
puts result
# For apply-templates.sh
File.write("docker-ruby/versions.json", result)
