# JavaBytecode

A Java class file parser.

### Usage

A class file can be parsed by supplying any `IO` object to
`JavaBytecode::JavaClass.new`:

```ruby
source_file = File.new('Test.class')
class_file  = JavaBytecode::JavaClass.new(source_file)
```
