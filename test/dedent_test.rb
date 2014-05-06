$:.unshift File.join(File.dirname(__FILE__), "../lib")
require "minitest/autorun"
require "minitest"
require "dedent"

class DedentTest < Minitest::Test
  def test_basic
    assert_equal "foobar", "   foobar".dedent
  end

  def test_whitespace
    assert_equal "", "".dedent
    assert_equal "", "   ".dedent
    assert_equal "", "   \n".dedent
    assert_equal "\n", "   \n   ".dedent
  end

  def test_multiple_lines
    s = <<-EOF
      foo
      bar
      baz
    EOF
    assert_equal "foo\nbar\nbaz", s.dedent
  end

  def test_indented
    s = <<-EOF
      foo
        bar
          baz
    EOF
    assert_equal "foo\n  bar\n    baz", s.dedent
  end

  def test_zero_indent
    s = <<EOF
foo
  bar
EOF
    assert_equal "foo\n  bar\n", s.dedent
  end
end
