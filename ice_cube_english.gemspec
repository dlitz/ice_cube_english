require 'lib/ice_cube/english/version'

spec = Gem::Specification.new do |s|

  s.name = 'ice_cube_english'
  s.author = 'Dwayne Litzenberger'
  s.description = 'ice_cube_english provides english time and date parsing for ice_cube.'
  s.email = 'dlitz@patientway.com'
  s.files = Dir['lib/**/*.rb', 'lib/**/*.treetop']
  s.has_rdoc = true
  s.homepage = 'https://github.com/dlitz/ice_cube_english'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'English time and date parsing for ice_cube'
  s.test_files = Dir.glob('test/*.rb')
  s.version = IceCube::English::VERSION
  s.rubyforge_project = "ice-cube-english"
  s.required_rubygems_version = ">= 1.3.6"
  s.extra_rdoc_files = %w( README.rdoc )
  s.add_runtime_dependency("treetop", ["~> 1.4.9"])
  s.add_runtime_dependency("ice_cube", ["~> 0.6.6"])

end
