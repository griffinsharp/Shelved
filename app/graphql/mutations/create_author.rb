class Mutations::CreateAuthor < GraphQL::Schema::Mutation

    # Not actually being used, just an alternative way to declare a mutation
    # This would be utilized by mutation_type where create_author has "mutation: Mutations::CreateAuthor"

    null true

    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Int, required: false
    argument :is_alive, Boolean, required: false

    def resolve(first_name:, last_name:, yob:, is_alive:)
        Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    end

end