class Types::ErrorType < Types::BaseObject 

description "An Active Record Object"

# "null: false" bc it needs to be there if there is an error.
field :field_name, String, null: false
field :errors, [String], null: false

end