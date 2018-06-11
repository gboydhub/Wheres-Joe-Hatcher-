ISTESTING = true
require "./src/cTextParser.rb"
require "test/unit"

class Test_text_parser < Test::Unit::TestCase
    def test_parser
        a = TextParser.new
        a.parse_string("hi there")
        assert_true(a.wasValid)
        assert_equal(a.parsedVerb, "hi")
        assert_equal(a.parsedSubject, "there")

        a.parse_string("")
        assert_false(a.wasValid)

        a.parse_string("test")
        assert_true(a.wasValid)
        assert_equal(a.parsedVerb, "test")
    end
end