class Types::CoordinatesType < Types::BaseObject

    field :longitude, Float, null: true
    field :latitude, Float, null: true

    def latitude 
        object.first
    end

    def longitude
        object.last
    end

end