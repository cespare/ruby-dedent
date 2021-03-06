ruby-dedent
===========

Installation
------------

    gem install dedent

Tested with Ruby 1.9.3 and 2.1.1.

Usage
-----

This is a tiny gem that adds the `dedent` method to String. This method strips leading whitespace from each
line, preserving indentation. So, the line with the least amount of leading whitespace will have all leading
whitespace removed, while other lines will have whitespace relative to that line's offset.

The main use of this is with heredocs. It can be annoying because even with the `<<-` form, all the initial
whitespace on each line of the string is preserved, so if you keep the string in the same indentation as the
code, you end up with extra space.

Here's an example of using dedent with heredocs:

``` ruby
      # Suppose we're already at some indentation within the code.
      foo = <<-EOS.dedent
        This might be a usage banner for a cli tool. Or, it might be some javascript. Or maybe shell code.
        for f in $(ls /foo/bar/); do
          cat $f >> $myfile;
        done
      EOS
```

Now the `foo` variable contains the following string:

```
This might be a usage banner for a cli tool. Or, it might be some javascript. Or maybe shell code.
for f in $(ls /foo/bar/); do
  cat $f >> $myfile;
done
```

One thing to note is that lines with no non-whitespace characters are not considered when determining the
indentation of a text block:

```
"\n  foo".dedent # => "\nfoo"
```

Author
------

This gem was written by Caleb Spare ([cespare](https://github.com/cespare) on github). It was inspired by
[Coffeescript's heredocs](http://jashkenas.github.com/coffee-script/#strings).

License
-------

This project is release under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
