class BookshelfSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # custom error
  def self.unauthorized_object(error) 
    raise GraphQL::ExecutionError, "Permissions congifuration do not allow the object you requested"
  end
end
