require_relative 'cRoom'
require_relative 'cItem'


class Game
    def initialize()
        @currentRoom = 0
        start()
    end

    def start()
    end

    def goto_room(room)
        @currentRoom = room
    end

    def parse_command(input)
        wordList = input.split
        if wordList.length <= 0 then
            return false
        end

        result = @currentRoom.try_verb(wordList[0])
        if(!result || result.length == 1) then
            return false
        end

        while(wordList.length > 2)
            if ["is", "to", "a"].include?(wordList[1])
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
                return true
            else
                return false
            end
        else
            return false
        end
        return false
    end
end

WheresJoeHatcher = Game.new