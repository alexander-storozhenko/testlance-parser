# frozen_string_literal: true

require_relative "lib/testlance_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "testlance_parser"
  spec.version       = TestlanceParser::VERSION
  spec.authors       = ["storozhenkoalex"]
  spec.email         = ["storozhenkoalex@yandex.ru"]

  spec.summary       = "answer parser for testlance-app"
  spec.description   = "parser for custom logic of test"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files       = %w(lib/testlance_parser.rb)

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
