init_file = File.expand_path('../init', __FILE__)
require init_file if File.exists?(init_file)

task :irb do
  ARGV.clear
  require 'irb'
  IRB.start
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--color'
end
