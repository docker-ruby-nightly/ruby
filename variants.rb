#!/usr/bin/env ruby

require "json"

json = JSON.parse(File.read("docker-ruby/versions.json"))
latest_release = json.compact.keys.max_by(&:to_f)

# Until irb releases a new version (current 1.15.1)
json[latest_release]["variants"].delete_if { |v| v.include?("bullseye")  }

puts json[latest_release]["variants"].to_json
