require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = questions(:one)
  end

  test"question should be valid" do
    assert @question.valid?
  end

  test "user_id should be present" do
    @question.user_id = nil
    assert_not @question.valid?
  end

  test "title should be present" do
    @question.title = "   "
    assert_not @question.valid?
  end
end
