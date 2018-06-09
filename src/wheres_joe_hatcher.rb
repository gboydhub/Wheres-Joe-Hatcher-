
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


    attr_reader     :name
    attr_reader     :desc
end