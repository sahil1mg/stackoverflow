class QuestionService

  def initialize(question_params)
    @question_params = question_params
  end

  def self.show_all
    Question.all
  end

  def ask_question
    puts "Starting saving new question"
    @question_params[:user_id]="1"
    question = Question.new(@question_params)
    question.save!
    return question
  end

  def self.delete_question(id)
    question = Question.find(id)
    question.destroy!
  end

  def update_question(id)
    question = Question.find(id)
    question.title = @question_params[:title]
    question.body = @question_params[:body]
    question.save!
    return question
  end

  def self.get_question(id)
    question = Question.find(id)
  end

end