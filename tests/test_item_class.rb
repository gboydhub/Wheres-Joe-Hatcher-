require "./src/cItem.rb"
require "test/unit"

class Test_item_class < Test::Unit::TestCase

    def test_item
        obj = Item.new("Sword", "a shiny sword", "With what?")
        assert_equal(obj.name, "Sword")
        assert_equal(obj.desc, "a shiny sword")
        assert_equal(obj.usetext, "With what?")
    end
end