class Types::PostType < Types::BaseObject

    description "A blog post"

    field :id, ID, null: false
    field :user, Types::UserType, null: false, description: "The author of the Post"
    field :body, String, null: true, description: "The contents of the Post"

    # Array of comments
    field :comments, [Types::CommentType], null: true, description: "Comments to this Post"


end