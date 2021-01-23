#!/usr/bin/env ruby

linter = "bundle exec slim-lint source/**/*.slim"
lint_count = 0 

output = %x[ #{linter} ]

paths = []
output.each_line do |line|
  path = line.split(":")[0]
  paths << path
  lint_count += 1 
end

grouped = Hash.new(0)
paths.each do |line|
  grouped[line] += 1
end

grouped.each do |k, v|
  puts "#{v} — #{k}"
end

puts "\n\n"
puts "------------------------------------------\n"
puts "------------------------------------------\n"
puts "You have #{lint_count} warnings."
