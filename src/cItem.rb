
class Item
    def initialize(name, desc)
        @name = name
        @desc = desc
        @verbs = {}
    end

    def update_verbs(verbs)
        @verbs.update(verbs)
    end

    def try_verb(verb)
        @verbs.each do |verbKey, value|
            if verbKey == verb then
                return value
            end
        end

        return false
    end

    attr_accessor     :name
    attr_accessor     :desc
end