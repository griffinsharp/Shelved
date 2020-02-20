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

  field :create_post, Types::PostType, null: true, description: "Create a Post" do
    argument :post, Types::PostInputType, required: true
  end

  def create_post(post:)
    Post.create(post.to_h)
  end

  field :update_post, Boolean, null: false, description: "Update a Post" do
    argument :post, Types::PostInputType, required: true
  end

  def update_post(post:)
    existing = Post.where(id: post[:id]).first
    if existing && existing.update(post.to_h)
      existing.update(post.to_h)
    end
  end

  field :delete_post, Boolean, null: false, description: "Delete a Post" do
    argument :id, ID, required: true
  end

  def delete_post(id:)
    Post.where(id: id).destroy_all
  end

  field :create_comment, Types::CommentType, null: true, description: "Create a Comment" do 
    argument :comment, Types::CommentInputType, required: true
  end

  def create_comment(comment:)
    Comment.create(comment.to_h)
  end

  field :update_comment, Boolean, null: false, description: "Update a Comment" do
    argument :comment, Types::CommentInputType, required: true
  end

  def update_comment(comment:)
    existing = Comment.where(id: comment[:id]).first
    if existing && existing.update(comment.to_h)
      existing.update(comment.to_h)
    end
  end

  field :delete_comment, Boolean, null: false, description: "Delete a Comment" do
    argument :id, ID, required: true
  end

  def delete_comment(id:)
    Comment.where(id: id).destroy_all
    true
  end
  

end
