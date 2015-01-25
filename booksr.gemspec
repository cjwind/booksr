Gem::Specification.new do |s|
    s.name = 'booksr'
    s.version = '0.1.1'
    s.date = '2015-01-25'
    s.summary = 'A simple book searcher'
    s.description = 'Search book with title, author, isbn or keyword by Google Book API.'
    s.authors = ['cjwind']
    s.email = 'cwentsai@gmail.com'
    s.files = Dir['lib/*.rb', 'lib/booksr/*.rb', 'Gemfile', 'README.md', 'Rakefile', '*.gemspec', 'test/*.rb']
    s.homepage = 'https://github.com/cjwind/booksr'
    s.license = 'MIT'

    s.add_runtime_dependency 'bundler'
    s.add_runtime_dependency 'rest-client'

    s.add_development_dependency 'test-unit'
end
