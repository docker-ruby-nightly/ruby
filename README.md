![Last successful build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fdocker-ruby-nightly%2Fruby%2Factions%2Fworkflows%2Fnightly.yml%2Fruns%3Fstatus%3Dcompleted%26event%3Dschedule&query=%24.workflow_runs%5B0%5D%5B'updated_at'%5D&logo=githubactions&label=Last%20successful%20build) ![Last build status](https://github.com/docker-ruby-nightly/ruby/actions/workflows/nightly.yml/badge.svg)

Fork of https://github.com/docker-library/ruby to build daily nightly images. Unfortunatly there will be no official nightly builds [[1]](https://github.com/docker-library/ruby/issues/222) and [circleci-ruby-snapshot-image](https://github.com/rubocop/circleci-ruby-snapshot-image) builds have stopped [[2]](https://github.com/rubocop/circleci-ruby-snapshot-image/issues/21).

The available variants will mirror the ones from the official images. The tags are structured in the following way:
* `alpine3.20-nightly-2024-05-27`
* `alpine3.20-nightly`
* `bookworm-nightly-2024-05-27`
* `bookworm-nightly`

Images are build for the following architectures: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v6`, `linux/386`, `linux/ppc64le`, and `linux/s390x`.

The full qualifier looks like `ghcr.io/docker-ruby-nightly/ruby:alpine3.20-nightly-2024-05-27`. List of previous builds: https://github.com/docker-ruby-nightly/ruby/pkgs/container/ruby
