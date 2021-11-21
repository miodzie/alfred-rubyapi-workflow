#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

SEARCH_URI = 'https://rubyapi.org/3.0/o/s?q='
uri = URI('https://rubyapi.org/graphql')
search = '{query}'
query = <<~QUERY
  {
    autocomplete(query: \"#{search}\") {
        text
        path
    }
  }
QUERY
q = { query: query }.to_json
res = Net::HTTP.post(uri, q, { 'Content-Type' => 'application/json' })
results = JSON.parse(res.body)
items = {}
items[:items] = Array.new(results['data']['autocomplete'].map do |x|
  { title: x['text'], arg: uri + x['path'], mods: { cmd: { arg: SEARCH_URI + search } } }
end)

items[:items].push({ title: 'View results online', arg: SEARCH_URI + search }) if items[:items].empty?

puts items.to_json
