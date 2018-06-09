
class Item
    def initialize(name, desc)
        @name = name
        @desc = desc
        @verbs = {}
        @altnames = Array.new
    end

    def update_verbs(verbs)
        @verbs.update(verbs)
    end

    def add_alt_name(name)
        @altnames.push(name)
    end

    def is_called?(name)
        name.eql? @altnames.detect{ |e| e == name}
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