require "./src/cItem.rb"
require "test/unit"

class Test_item_class < Test::Unit::TestCase

    def test_item
        obj = Item.new("Sword", "a shiny sword")
        assert_equal(obj.name, "Sword")
        assert_equal(obj.desc, "a shiny sword")
    end

    def test_item_verbs
        paper = Item.new("Paper", "scrap of paper")
        paper.update_verbs({'read' => 'It says: Hello World!'})
        assert_equal(paper.try_verb("read"), "It says: Hello World!")
        assert_false(paper.try_verb("test"))
    end
end