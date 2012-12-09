def __ROOT__
  @__root__ ||= File.dirname(__FILE__)
end

$LOAD_PATH << File.join(__ROOT__, 'lib')

require 'fileutils'
require 'formatter'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

task :compile => :compass do
  File.open("#{__ROOT__}/output/resume.html", 'w') do |file|
    content = Formatter.new(__ROOT__).render!
    file.write content
  end
end

task :compass do
  Dir.chdir(__ROOT__) do
    sh %{bundle exec compass compile}
  end
end

task :default => :compile
