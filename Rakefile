require 'lib/ice_cube/english/version'

task :build => :test do
  system "gem build ice_cube_english.gemspec"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |t|
  t.rdoc_files = Dir.glob(%w( README* MIT-LICENSE lib/**/*.rb *.rdoc )).uniq
  t.main = "README.rdoc"
  t.title = "scriptty - RDoc Documentation"
  t.options = %w( --charset -UTF-8 --line-numbers )
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.libs = %w( lib test )
end

task :default => :build
