require File.dirname(__FILE__) + '/markdownj-1.0.2b4-0.3.0.jar'

class MarkdownJ
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def to_html
    com.petebevin.markdown.MarkdownProcessor.new.markdown(@text)
  end
end
