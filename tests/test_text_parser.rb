ISTESTING = true
require "./src/cTextParser.rb"
require "test/unit"

class Test_text_parser < Test::Unit::TestCase
    def test_has_string
        a = TextParser.new
        a.parse_string("hi there")
        assert_true(a.wasValid)
        a.parse_string("")
        assert_false(a.wasValid)
        a.parse_string("test")
        assert_true(a.wasValid)
    end
end