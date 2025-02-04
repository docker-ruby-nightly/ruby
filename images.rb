#!/usr/bin/env ruby

require "json"

json = JSON.parse(File.read("docker-ruby/versions.json"))
latest_release = json.compact.keys.max_by(&:to_f)
variants = json[latest_release]["variants"]

# Result:
# [
#   { "variant": "slim-bullseye", "platform": "linux/amd64" },
#   { "variant": "slim-bullseye", "platform": "linux/arm64/v8" },
#   { "variant": "slim-bullseye", "platform": "linux/386" },
#   { "variant": "alpine3.20", "platform": "linux/amd64" },
#   { "variant": "alpine3.20", "platform": "linux/arm64/v8" },
#   { "variant": "alpine3.20", "platform": "linux/386" }
# ]
images = variants.filter_map do |variant|
  # Until irb releases a new version
  next if variant.include?("bullseye")

  # debian:bullseye-slim
  base_image = File.read("docker-ruby/master/#{variant}/Dockerfile")[/FROM (.*)/, 1]
  manifest_inspect = JSON.parse(`docker manifest inspect #{base_image}`)

  # ["linux/amd64", "linux/arm64/v8", "linux/386"]
  platforms = manifest_inspect["manifests"].filter_map do |manifest|
    platform = manifest["platform"]
    next unless platform["os"] == "linux"

    optional_variant = "/#{platform['variant']}" if platform['variant']
    "#{platform['os']}/#{platform['architecture']}#{optional_variant}"
  end

  platforms.map { |platform| { variant: variant, platform: platform } }
end.flatten

puts images.to_json
