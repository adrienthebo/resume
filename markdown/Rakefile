$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'fileutils'
require 'formatter'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

ROOT = "#{File.dirname(__FILE__)}"

task :compile => ["#{ROOT}/output", :compass]

task :compile do

  File.open("#{ROOT}/output/resume.html", 'w') do |file|

    f = Formatter.new(ROOT)

    file.write f.render!
  end
end

directory "#{ROOT}/output"

task :compass do
  Dir.chdir(ROOT) do
    sh %{bundle exec compass compile}
  end
end

task :default => :compile
