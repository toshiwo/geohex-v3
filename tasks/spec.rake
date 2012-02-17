require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./spec/**/*_spec.rb"
  # Put spec opts in a file named .rspec in root
end

desc "Generate code examples statistics"
task :coverage do
  ENV['COVERAGE'] = 'true'

  Rake::Task['spec'].execute
end

