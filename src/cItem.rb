
class Item
    def initialize(name, desc, usetext)
        @name = name
        @desc = desc
        @usetext = usetext
    end

    attr_accessor     :name
    attr_accessor     :desc
    attr_accessor     :usetext
end