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

        

        @wasValid = true
        return
    end

    attr_reader     :wasValid
    attr_reader     :parsedVerb
    attr_reader     :parsedSubject
end