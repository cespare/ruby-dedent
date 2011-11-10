ruby-dedent
===========

This is a tiny gem that adds the `dedent` method to String. This method strips leading whitespace from each
line, preserving indentation. So, the line with the least amount of leading whitespace will have all leading
whitespace removed, while other lines will have whitespace relative to that line's offset.
