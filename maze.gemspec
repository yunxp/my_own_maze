
Gem::Specification.new do |gem|
  gem.authors       = [""]
  gem.email         = [""]
  gem.description   = %q{Maze Game}
  gem.summary       = ""
  gem.homepage      = "git@github.com:yunxp/maze.git"

  gem.require_paths = %w{ lib lib/model }
  gem.executables   = %w{ maze }
  gem.files         = Dir.glob("{bin,lib,config}/**/*")
  gem.name          = "maze"
  gem.version       = "0.0.1"
end
