
Gem::Specification.new do |gem|
  gem.authors       = ["yun"]
  gem.email         = ["yunxphn@163.com"]
  gem.description   = %q{Maze Game}
  gem.summary       = %q{Maze Game}
  gem.homepage      = "https://github.com/yunxp/my_own_maze"

  gem.require_paths = %w{ lib lib/model }
  gem.executables   = %w{ maze }
  gem.files         = Dir.glob("{bin,lib,config}/**/*")
  gem.name          = "my_own_maze"
  gem.version       = "1.0.2"
end
