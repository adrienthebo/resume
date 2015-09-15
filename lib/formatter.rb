require 'erb'
require 'kramdown'
require 'logger'

$logger = Logger.new($stderr)

class Formatter
  def initialize(root)
    @root = root

    @layout = File.join(@root, 'layouts', 'resume.html')
  end

  def render!
    $logger.info "Using layout #{@layout}"
    layout()
  end

  private

  def render_markdown
    File.read(@mkd)
  end

  def layout(&block)
    l = File.read(@layout)

    ERB.new(l).result(binding)
  end

  def partial(name)

    $logger.info "Including partial #{name}"
    content = File.read(File.join(@root, 'resume', name))

    body = Kramdown::Document.new(content, parse_block_html: true)
    body.to_html
  end

  def section(name)
    section_id = name[/[^.]+/].gsub(/\//, '-')

    <<-EOD
    <section id="#{section_id}">
      #{partial(name)}
    </section>
    EOD
  end
end
