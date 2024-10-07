#!/usr/bin/env ruby

require "json"

image = ARGV[0]
json = JSON.parse(`docker manifest inspect #{image}`)

identifiers = json["manifests"].filter_map do |manifest|
  platform = manifest["platform"]
  next unless platform["os"] == "linux"

  optional_variant = "/#{platform['variant']}" if platform['variant']
  "#{platform['os']}/#{platform['architecture']}#{optional_variant}"
end

puts identifiers.join(",")
