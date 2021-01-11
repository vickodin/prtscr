# frozen_string_literal: true

require_relative 'lib/prtscr/version'

Gem::Specification.new do |spec|
  spec.name          = 'prtscr'
  spec.version       = Prtscr::VERSION
  spec.authors       = ['vickodin']
  spec.email         = ['vick.orel@gmail.com']

  spec.summary       = 'PrtScr.ru API gem'
  spec.description   = 'Website screenshot API gem for https://prtscr.ru'
  spec.homepage      = 'https://github.com/vickodin/prtscr'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/vickodin/prtscr'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
