require File.dirname(__FILE__) + '/test_helper'

class MarkdownJTest < Test::Unit::TestCase
  def test_should_initialize_with_a_text_value
    assert_nothing_raised { MarkdownJ.new('some_text') }
  end

  def test_should_require_a_text_value_when_initializing
    assert_raise(ArgumentError) { MarkdownJ.new }
  end

  def test_should_render_text_to_html
    assert_equal MarkdownJ.new('This *is* **really** _very_ __interesting__').to_html,
                 "<p>This <em>is</em> <strong>really</strong> <em>very</em> <strong>interesting</strong></p>\n"
  end

  def test_should_have_text_accessible_as_an_attr_accessor
    mdj = MarkdownJ.new('Original Text')
    mdj.text = 'Other Text'
    assert_equal mdj.text, 'Other Text'
  end

  def test_should_render_the_new_text_as_html_after_the_text_has_been_changed
    mdj = MarkdownJ.new('_Original_ Text')
    assert_equal mdj.to_html, "<p><em>Original</em> Text</p>\n"

    mdj.text = 'New *Text*'
    assert_equal mdj.to_html, "<p>New <em>Text</em></p>\n"
  end
end
