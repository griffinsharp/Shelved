class Types::CommentType < Types::BaseObject

description "A blog post comment"

field :id, ID, null: false
field :body, String, null: true, description: "The body of the Comment"

# There is no "has many" for comments, so there are no additional fields

end