require "dedent/version"

class String
  def dedent
    lines = split "\n"
    return self if lines.empty?
    min_indent = lines.map { |line| line.start_with?(" ") ? line.match(/^ +/).offset(0)[1] : 0 }.min
    return self if min_indent.zero?
    lines.map { |line| line.gsub(/^ {#{min_indent}}/, "") }.join("\n")
  end
end
