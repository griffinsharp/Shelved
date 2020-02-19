class Types::MutationType < Types::BaseObject

  field :create_author, AuthorType, null: true, description: "Create An Author" do
    argument :author, Types::AuthorInputType, required: true
  end  

  # Convert to hash to align with Rails convention
  def create_author(author:)
    Author.create(author.to_h)
  end

  # Alternative way of defining mutation:
  # field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

  field :update_author, Boolean, null: false, description: "Update An Author" do 
    argument :author, Types::AuthorInputType, required: true
  end

  def update_author(author:)
    existing = Author.where(id: author[:id]).first

    if existing.save!
      existing.update(author.to_h)
    end
    

  end

end
