$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task :default => :spec

desc "Run spec"
task :spec do
  sh "cd spec \n rspec -I. matrices_spec.rb"
end

