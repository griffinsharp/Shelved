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

  # ROOT FIELD
  field :author, Types::AuthorType, null: true, description: "One author" do
    argument :id, ID, required: true
  end

  # Field of author with argument ID ("Resolver Method" for Author Field)
  def author(id:)
    Author.find_by(id: id)
  end

  # Complex Type for Author Array
  field :authors, [Types::AuthorType], null: false

  # Resolver method now returns all the authors, instead of one.
  def authors
    Author.all
  end

  field :login, String, null: true, description: "A Login Field" do 
    argument :email, String, required: true
    argument :password, String, required: true
  end

  def login(email:, password:)
    @user = User.where(email: email).first
    if (@user && @user.authenticate(password))
      # user session created / key is returned
      @user.sessions.create.key
    end
  end

  field :logout, Boolean, null: false

  def logout
    Session.where(id: context[:session_id]).destroy_all
  end

  # --------- PRACTICE ---------

  # user - removed for testing/conflicts with practice 
  # field :user, Types::UserType, null: true, description: "Retrieve a user by ID" do
  #   argument :id, ID, required: true, description: 'A user id'
  # end

  # def user(id:)
  #   User.where(id: id).first
  # end

  # current_user
  field :current_user, Types::UserType, null: true, description: "Retrieve a User by Id"

  def current_user
    context[:current_user]
  end

  # post_type.rb
  field :post, Types::PostType, null: true, description: "Retrieve a Post by ID" do
    argument :id, ID, required: true, description: 'A post ID'
  end

  def post(id:)
    Post.where(id: id).first
  end

  # comment_type.rb
  field :comment, Types::CommentType, null: true, description: "Retrieve a Comment by ID" do
    argument :id, ID, required: true, description: "A comment ID"
  end

  def comment(id:)
    Comment.find_by(id: id)
  end

  # --------- END PRACTICE ---------

end
