class QuestionService

  def initialize(question_params)
    @question_params = question_params
  end

  def self.show_all
    Question.not_deleted.includes(:tags, :votes, :user).all
  end

  def ask_question
    puts "Starting saving new question"
    question = Question.new(@question_params)
    question.save!
    return question
  end

  def self.delete_question(id)
    puts "Deleting question #{id}"
    question = Question.find(id)
    question.touch(:deleted_at)
  end

  def update_question(id)
    question = Question.find(id)
    question.title = @question_params[:title]
    question.body = @question_params[:body]
    question.save!
    return question
  end

  def self.get_question(id)
    question = Question.not_deleted.includes(:user, :tags, :comments).find(id)
  end

end