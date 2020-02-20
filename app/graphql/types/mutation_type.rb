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
    if existing && existing.update(author.to_h)
      existing.update(author.to_h)
    end
  end

  field :delete_author, Boolean, null: false, description: "Delete an Author" do
    argument :id, ID, required: true
  end

  def delete_author(id:)
    Author.where(id: id).destroy_all
    true
  end

# USER -----

  field :create_user, UserType, null: true, description: "Create a User" do
    argument :user, Types::UserInputType, required: true
  end

  def create_user(user:)
    User.create(user.to_h)
  end

  field :update_user, Boolean, null: false, description: "Update a User" do 
    argument :user, Types::UserInputType, required: true
  end

  def update_user(user:)
    existing = User.where(id: user[:id]).first
    if existing && existing.update(user.to_h)
      existing.update(user.to_h)
    end
  end

  field :delete_user, Boolean, null: false, description: "Delete a User" do
    argument :id, ID, required: true
  end

  def delete_user(id:)
    User.where(id: id).destroy_all
    true
  end


end
