class QuestionController < ApplicationController

  def show
    @questions = Question.all
    respond_to do |format|
      format.json {render json: @questions}
      format.html {render json: @questions}
    end
  end
end
