require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  def setup
    @answer = answers(:one)
  end

  test"answer should be valid" do
    assert @answer.valid?
  end

  test "statement should be present" do
    @answer.text = "   "
    assert_not @answer.valid?
  end

  test "user_id should be present" do
    @answer.user_id = nil
    assert_not @answer.valid?
  end

  test "question_id should be present" do
    @answer.question_id = nil
    assert_not @answer.valid?
  end
end
