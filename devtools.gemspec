Gem::Specification.new do |s|
  s.name        = 'devtools'
  s.version     = '0.0.1'
  s.summary     = "A bunch of random dev tools"
  s.authors     = ["Dylan McKay"]
  s.email       = 'me@dylanmckay.io'
  s.files       = Dir.glob("lib/**/*.rb")
  s.executables = %w(dt)
  s.license       = 'MIT'
end

