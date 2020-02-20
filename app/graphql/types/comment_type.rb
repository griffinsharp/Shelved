class Types::CommentInputType < Types::BaseInputObject

    graphql_name "CommentInputType"
    description "All the attributes needed for comment creation/updating"

    argument :id, ID, required: false
    argument :post_id, ID, required: false
    argument :body, String, required: true

end


class Types::CommentType < Types::BaseObject

description "A blog post comment"

field :id, ID, null: false
field :body, String, null: true, description: "The body of the Comment"

# There is no "has many" for comments, so there are no additional fields

end