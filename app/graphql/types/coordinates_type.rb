class Types::CoordinatesType < Types::BaseObject

    field :longitude, Float, null: true
    field :latitude, Float, null: true

    def latitude 
        object.first
    end

    def longitude
        object.last
    end

    # prevent authors in certain parts of the world scenario
    def self.authorized?(object, context)
        object.first > 10 && object.last < 10
    end

end