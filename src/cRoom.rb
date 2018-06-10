class Room
    def initialize(name, desc)
        @name = name
        @desc = desc
        @exits = {}
        @verbs = {}
        @objects = {}
    end

    def update_exits(exitlist)
        @exits.update(exitlist)
    end

    def update_verbs(verblist)
        @verbs.update(verblist)
    end

    def update_objects(objlist)
        @objects.update(objlist)
    end

    def get_exit(name)
        return @exits[name]
    end

    def try_verb(verb)
        @verbs.each do |verbKey, value|
            if verbKey == verb then
                return value
            end
        end
        @objects.each do |oKey, obj|
            if obj.try_verb(verb) then
                return obj.try_verb(verb)
            end
        end

        return false
    end

    def item_exists?(name)
        @objects.has_key? name
    end

    def try_item_verb(verb, itemname)

    end


    attr_reader     :name
    attr_reader     :desc
end