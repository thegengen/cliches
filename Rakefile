require "bundler/gem_tasks"
require "rake/testtask"
require 'cane/rake_task'
require 'rdoc/task'

desc "Run the tests"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "Run cane to check quality metrics"
Cane::RakeTask.new(:quality) do |cane|
  cane.style_measure = 100
end

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/cliches/*.rb")
end

task default: [:test, :quality]