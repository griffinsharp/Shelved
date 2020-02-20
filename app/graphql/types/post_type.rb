class Types::PostInputType < Types::BaseInputObject

graphql_name "PostInputType"
description "All the attributes for post creation/updating"

argument :id, ID, required: false
argument :user_id, ID, required: false, description: "The author of the Post"
argument :body, String, required: true, description: "The contents of the Post"

end


class Types::PostType < Types::BaseObject

    description "A blog post"

    field :id, ID, null: false
    field :user, Types::UserType, null: false, description: "The author of the Post"
    field :body, String, null: true, description: "The contents of the Post"

    # Array of comments (has_many)
    field :comments, [Types::CommentType], null: true, description: "Comments to this Post"


end