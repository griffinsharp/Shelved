class Types::UserInputType < GraphQL::Schema::InputObject 

graphql_name "UserInputType"
description "All the attributes for User creation"

# make sure these are arguments for the input types (not fields)
# also they are required: false because they are args, not null: true (like fields)
  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :street, String, required: false
  argument :number, String, required: false
  argument :postcode, String, required: false
  argument :city, String, required: false
  argument :country, String, required: false

end

class Types::UserType < Types::BaseObject
  description "A User"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :street, String, null: true
  field :number, String, null: true
  field :city, String, null: true
  field :postcode, String, null: true
  field :country, String, null: true

  field :created_at, String, null: true

  def created_at
    object.created_at.iso8601 # easily parsed by Javascript
  end

  field :address, String, null: true

# this finds the street, number, postcode, and country method on the user object and strips the answer of any whitespace
# then any "nil" values are remove
# then any space/empty '' values are removed
# array elements are joined on a ', ' to create an adress 
  def address
    ([:street, :number, :postcode, :country].map do |a|
      object.send(a)&.strip
    end.compact - ['']).join(', ')
  end

  field :posts, [Types::PostType], null: true, description: "A user's posts"

end