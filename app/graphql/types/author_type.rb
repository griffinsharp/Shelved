class Types::AuthorType < Types::BaseObject

    description "An author"

    # All the fields that an author may have

    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :yob, Int, null: false
    field :is_alive, Boolean, null: true
    field :full_name, String, null: true

    # Can either define the custom field here (full_name) or on the model (author.rb)
    # Object here refers to the author active record instance
    # Types::CoordinatesType is defined on the Author model (author.rb)

    def full_name 
        ([object.first_name, object.last_name].compact).join(" ")
    end

    # Custom type - Coordinates
    # Array of two nums like [90, 90]
    field :coordinates, Types::CoordinatesType, null: false

    # Defined a field for the method we made on the model (author.rb)
    # Type here is an array of integers
    field :publication_years, [Int], null: false
    



end