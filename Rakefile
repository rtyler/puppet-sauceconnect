require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Build a Puppet module"
task :build do
  sh 'puppet module build'
end

task :default => [:spec, :build]
