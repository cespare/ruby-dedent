class String
  def dedent
    lines = split "\n"
    return self if lines.empty?
    indents = lines.map do |line|
      line =~ /\S/ ? (line.start_with?(" ") ? line.match(/^ +/).offset(0)[1] : 0) : nil
    end
    indents.compact!
    if indents.empty?
      # No lines had any non-whitespace characters.
      return ([""] * lines.size).join "\n"
    end
    min_indent = indents.min
    return self if min_indent.zero?
    lines.map { |line| line =~ /\S/ ? line.gsub(/^ {#{min_indent}}/, "") : line }.join "\n"
  end
end
