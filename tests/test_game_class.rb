require "./src/wheres_joe_hatcher.rb"
require "./src/cRoom.rb"
require "test/unit"

class Test_game_class < Test::Unit::TestCase

    def test_command

        entrance = Room.new("Entrance", "You can go north.")
        northroom = Room.new("The north", "So cold here")

        entrance.update_exits({"north" => northroom})
        entrance.update_verbs({"go" => "exit", "walk" => "exit"})
        northroom.update_exits({"south" => entrance})
        northroom.update_verbs({"go" => "exit", "walk" => "exit"})

        tester = Game.new
        tester.goto_room(entrance)
        
        assert_false(tester.parse_command("eat pizza"))
        assert_true(tester.parse_command("walk north"))

        assert_true(tester.parse_command("go to south"))
    end
end