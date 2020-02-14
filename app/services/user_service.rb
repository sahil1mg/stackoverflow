class UserService

  def initialize(user_params)
    @user_params = user_params
  end

  #create
  def sign_up
    user = User.new(@user_params)
    user[:is_admin]=false
    user.save!
    return user
  end

  #get
  def self.get_user(id)
    User.includes(:tags, :questions, answers: [:votes]).find(id)
  end

  #update
  def update_user(id)
    user = User.find(id)
    user.update!(@user_params)
    return user
  end

  #destroy
  def self.destroy_user(user_id)
    user = User.find(user_id)
    user.touch(:deleted_at)
    user.questions.each do |question|
      question.touch(:deleted_at)
    end
    return user
  end

  #all
  def self.showAll
    User.not_deleted.all
  end
end