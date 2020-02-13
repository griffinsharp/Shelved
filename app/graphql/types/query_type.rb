class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, null: false,
    description: "An example field added by the generator" do
      argument :name, String, required: true
    end
  def test_field(name:)
    Rails.logger.info context[:time]
    "Hello #{name}!"
  end
end
