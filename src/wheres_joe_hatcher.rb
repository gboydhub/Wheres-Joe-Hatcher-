require_relative 'cRoom'
require_relative 'cItem'


class Game
    def initialize()
        @rmEntrance = Room.new("Entrance", <<-DESC
            You can walk up the stairwell or go north to the elevator.
            There's also stairs that go down, but they are blocked off.
            DESC
        )
        @rmStairwellB = Room.new("Stairwell [2F]", <<-DESC
            There is a door here, or you can go up or down the stairs.
            DESC
        )
        @rmElevatorA = Room.new("Elevator [1F]", <<-DESC
            You are on the first floor. There is a panel of buttons here.
            You can also go south to the entrance of the building.
            DESC
        )
        @rmElevatorB = Room.new("Elevator [3F]", <<-DESC
            You are on the third floor. There is a panel of buttons here.
            You can also go east to the office hallway.
            DESC
        )
        @objElevAPanel = Item.new("panel", "elevator panel")
        @objElevAPanel.update_verbs({"look" => "Buttons are labeled: B1, 1F, 2F, 3F, 4F"})

        @rmEntrance.update_verbs({"walk" => "exit", "go" => "exit"})
        @rmEntrance.update_exits({"up" => @rmStairwellB, "north" => @rmElevatorA, "elevator" => @rmElevatorA})

        @rmStairwellB.update_verbs({"walk" => "exit", "go" => "exit"})
        @rmStairwellB.update_exits({"down" => @rmEntrance})

        @rmElevatorA.update_verbs({"walk" => "exit", "go" => "exit", "push" => "exit"})
        @rmElevatorA.update_exits({"south" => @rmEntrance, "entrance" => @rmEntrance, "3F" => @rmElevatorB})

        @rmElevatorA.update_verbs({"walk" => "exit", "go" => "exit", "push" => "exit"})
        @rmElevatorA.update_exits({"east" => @rmEntrance, "hall" => @rmEntrance, "1F" => @rmElevatorA})

        @isRunning = true
    end

    def start()
        @currentRoom = @rmEntrance
        @lastRoom = nil
        system "clear" or system "cls"
        sleep 0.3
        puts "You walk through the glass door, into the Entrance of the building.\n\n"

        @showDescFlag = true
        while @isRunning == true do
            if @showDescFlag then
                @showDescFlag = false
                puts "#{@currentRoom.name}"
                puts @currentRoom.desc
            end
            puts "\nWhat will you do?"
            print "> "
            inString = gets.chomp
            parseResult = parse_command(inString)
            if !parseResult then
                puts "\nI dont understand that command."
            end
        end
    end

    def refresh_room()
        system "clear" or system "cls"
        @showDescFlag = true
    end


    def goto_room(room)
        @lastRoom = @currentRoom
        @currentRoom = room
    end

    def parse_command(input)
        wordList = input.split
        if wordList.length <= 0 then
            return false
        end

        result = @currentRoom.try_verb(wordList[0])
        if(!result || wordList.length == 1) then
            if wordList[0] == "quit" then
                @isRunning = false
                return true
            elsif wordList[0] == "look" then
                refresh_room()
                return true
            end
            return false
        end

        while(wordList.length > 2)
            if ["is", "to", "a", "the", "at"].include?(wordList[1])
                wordList[1] = wordList[2]
                wordList.delete_at(2)
            else
                return false
            end
        end

        case result
        when "exit"
            nextRoom = @currentRoom.get_exit(wordList[1])
            if nextRoom then
                goto_room(nextRoom)
                if !defined?(ISTESTING); refresh_room() end
                return true
            else
                return false
            end
        when "item_verb"
            if @currentRoom.item_exists?(wordList[1]) then

            end
        else
            return false
        end
        return false
    end
end

if(!defined? ISTESTING) then
    WheresJoeHatcher = Game.new
    WheresJoeHatcher.start()
end