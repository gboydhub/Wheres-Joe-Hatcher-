require "./src/cRoom.rb"
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
end