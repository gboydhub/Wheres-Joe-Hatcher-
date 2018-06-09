
class Item
    def initialize(name, desc, usetext)
        @name = name
        @desc = desc
        @usetext = usetext
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

    attr_accessor     :name
    attr_accessor     :desc
    attr_accessor     :usetext
end