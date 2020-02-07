class UserService

  def initialize(user_params)
    @user_params = user_params
  end

  #create
  def sign_up
    user = User.new(@user_params)
    user.save!
  end

  #get
  def self.get_user(id)
    User.find(id)
  end

  #update
  def update_user
    @user.update!(@user_params)
  end

  #destroy
  def self.destroy_user(user_id)
    user = User.find(user_id)
    user.destroy!
  end

  #all
  def self.showAll
    User.all
  end
end