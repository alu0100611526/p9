$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task :default => :spec


desc "Run UnitTest"
task :test do
  sh "ruby -Ilib -Itest test/tc_MatrizDispersa.rb \n ruby -Ilib -Itest test/tc_MatrizDensa.rb" 
end

