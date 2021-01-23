#!/usr/bin/env ruby

linter = "bundle exec slim-lint source/**/*.slim"
lint_count = 0 

output = %x[ #{linter} ]

warnings = []
output.each_line do |line|
  path = line.split(":")[0]
  warnings << path
end

grouped = Hash.new(0)
warnings.each do |line|
  grouped[line] += 1
end

grouped.each do |k, v|
  puts "#{v} — #{k}"
end

puts "\n\n"
puts "------------------------------------------\n"
puts "------------------------------------------\n"
puts "You have #{warnings.count} warnings."
