require 'erb'
require 'kramdown'

class Formatter
  def initialize(root)
    @root = root

    @layout = File.join(@root, 'layouts', 'resume.html')
  end

  def render!
    puts "Using layout #{@layout}"
    layout()
  end

  private

  def render_markdown
    content = File.read(@mkd)

  end

  def layout(&block)
    l = File.read(@layout)

    ERB.new(l).result(binding)
  end

  def partial(name)

    puts "partial (#{name}) -> (#{@layout})"
    content = File.read(File.join(@root, 'resume', name))

    body = Kramdown::Document.new(content)
    body.to_html
  end
end
