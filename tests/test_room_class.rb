require "./src/cRoom.rb"
require "./src/cItem.rb"
require "test/unit"

class Test_room_class < Test::Unit::TestCase

    def test_room
      home = Room.new("Home", "Exit to the north")
      assert_equal(home.name, "Home")
      assert_equal(home.desc, "Exit to the north")
    end
  
    def test_exits
      home = Room.new("Home", "Exit to the north")
      testroom = Room.new("Error", "Why are you here?")
      north = Room.new("North room", "Hi there")
      home.update_exits({'north' => north, 'test' => testroom})
  
      assert_equal(home.get_exit("north"), north)
      assert_equal(home.get_exit("test"), testroom)
  
      try = home.get_exit("north")
      assert_equal(try.name, "North room")
    end

    def test_verbs
      place = Room.new("Place", "Someplace")
      place.update_verbs({'go' => 'exit', 'move' => 'exit', 'pickup' => 'get'})

      assert_equal(place.try_verb("go"), "exit")
      assert_equal(place.try_verb("move"), "exit")
      assert_equal(place.try_verb("pickup"), "get")
      assert_false(place.try_verb("hi"))
    end

    def test_objs
      place = Room.new("Place", "Someplace")
      newItem = Item.new("paper", "scrap")
      newItem.update_verbs({"read" => "Its a piece of paper"})
      place.update_objects({"paper" => newItem})
      assert_equal(place.try_verb("read"), "Its a piece of paper")
      assert_false(place.item_exists?("test"))
      assert_true(place.item_exists?("paper"))
    end
end