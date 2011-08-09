require File.expand_path('../lib/pool_stats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'pool_stats'
  gem.version     = PoolStats::VERSION.dup
  gem.author      = 'Joseph Anthony Pasquale Holsten'
  gem.email       = 'joseph@josephholsten.com'
  gem.homepage    = 'https://github.com/josephholsten/pool_stats'
  gem.summary     = %q{Ruby wrapper for various bitcoin mining pool APIs}
  gem.description = %q{Ruby wrapper for various bitcoin mining pool APIs}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.require_paths = ['lib']

  gem.add_development_dependency 'ZenTest'
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'maruku'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'yard'

  gem.add_runtime_dependency 'faraday', '>= 0.7'
  gem.add_runtime_dependency 'faraday_middleware', '>= 0.7'
  gem.add_runtime_dependency 'multi_json', '>= 1.0'
  gem.add_runtime_dependency 'activesupport', '>= 2.2' 
  gem.add_runtime_dependency 'i18n'
end

