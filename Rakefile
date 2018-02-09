task :default => [:spec]
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = ['--color --format progress --require spec_helper']
  end
rescue LoadError => e
end
