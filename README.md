![Last successful build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdocker-ruby-nightly%2Fruby%2Factions%2Fworkflows%2Fnightly.yml%2Fruns%3Fstatus%3Dsuccess%26event%3Dschedule&query=%24.workflow_runs%5B0%5D%5B'updated_at'%5D&logo=githubactions&label=Last%20successful%20build) ![Last build status](https://github.com/docker-ruby-nightly/ruby/actions/workflows/nightly.yml/badge.svg)

Fork of https://github.com/docker-library/ruby to build daily nightly images.

The available variants will mirror the ones from the official images. The tags are structured in the following way:
* `alpine3.20-nightly-2024-05-27`
* `alpine3.20-nightly`
* `bookworm-nightly-2024-05-27`
* `bookworm-nightly`
* etc.

Use it like so:
```Dockerfile
FROM ghcr.io/docker-ruby-nightly/ruby:alpine3.20-nightly-2024-05-27
...
```

List of previous builds: https://github.com/docker-ruby-nightly/ruby/pkgs/container/ruby
