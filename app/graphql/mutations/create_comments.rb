class Mutations::CreateComment < GraphQL::Schema::Mutation
    null true

    argument :comment, Types::CommentInputType, required: true

    def resolve(comment:)
        Comment.create(comment.to_h)
    end

    # this makes sure that only user's who are members can make/edit a comment
    def self.accessible?(context)
        context[:current_user]&.role == 'member'
    end


end