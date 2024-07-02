#!/usr/bin/env ruby

require "json"

json = JSON.parse(File.read("versions.json"))
latest_release = json.compact.keys.max_by(&:to_f)
puts json[latest_release]["variants"].to_json
