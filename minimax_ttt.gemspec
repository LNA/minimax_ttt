Gem::Specification.new do |s|
  s.name        = 'minimax_ttt'
  s.version     = '0.0.7'
  s.date        = '2014-05-27'
  s.summary     = "A gem for tic tac toe in Ruby."
  s.description = "Plugs into Rails, Sinatra and Command Line games."
  s.authors     = ["LaToya Allen"]
  s.email       = 'lallen@8thlight.com'
  s.homepage    =
    'http://rubygems.org/gems/minimax_ttt'
  s.license       = 'MIT'

  s.files       = Dir.glob("{lib, spec}/**/*")
  s.require_path = 'lib'
end
