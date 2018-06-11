class TextParser
    def initialize()
        @wasValid = false
        @parsedVerb = ""
        @parsedSubject = ""
    end

    def parse_string(input)
        wordAry = input.downcase.split
        @wasValid = false
        if wordAry.length == 0 then
            @wasValid = false
            return
        end

        while(wordAry.length > 2)
            if ["is", "to", "a", "the", "at"].include?(wordAry[1])
                wordAry[1] = wordAry[2]
                wordAry.delete_at(2)
            else
                wasValid = false
                return
            end
        end

        @parsedVerb = wordAry[0]
        if wordAry.length > 1 then
            @parsedSubject = wordAry[1]
        end

        @wasValid = true
        return
    end

    attr_reader     :wasValid
    attr_reader     :parsedVerb
    attr_reader     :parsedSubject
end