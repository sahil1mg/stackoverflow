class AnswerService

  def initialize(answer_params)
    @answer_params = answer_params
  end

  def self.show_all
    Answer.all
  end

  def submit_answer
    answer = Answer.new(@answer_params)
    answer.save!
    return answer
  end

  def edit_text(answer_id)
    answer = Answer.find(answer_id)
    if(answer)
      answer.text = @answer_params[:text]
      answer.save!
    end
    return answer
  end

  def self.destroy_answer(answer_id)
    answer = Answer.find(answer_id)
    answer.touch(:deleted_at)
  end
end