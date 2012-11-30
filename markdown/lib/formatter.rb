require 'erb'
require 'kramdown'

class Formatter
  def initialize(mkd, layout)
    @mkd, @layout = mkd, layout
  end

  def render!
    body = render_markdown

    layout() { body }
  end

  private

  def render_markdown
    content = File.read(@mkd)

    body = Kramdown::Document.new(content)

    body.to_html
  end

  def layout(&block)
    l = File.read(@layout)

    ERB.new(l).result(binding)
  end
end
