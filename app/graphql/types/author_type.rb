class Types::AuthorInputType < GraphQL::Schema::InputObject 

    graphql_name "AuthorInputType"
    description "All the attributes for author creation"

    # all arguments should not be required so that we can use one input for both creating, updating, etc.
    argument :id, ID, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Int, required: false
    argument :is_alive, Boolean, required: false

end

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

    field :errors, [Types::ErrorType], null: true

    def errors
        object.errors.map { |e| {field_name: e, errors: object.errors[e]} }
    end
    
end