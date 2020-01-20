require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
    @wrong_comment = comments(:two)
  end

  test"comment should be valid" do
    assert @comment.valid?
  end

  test "comment is commented_on_type is not Question or Answer" do
    assert_not @wrong_comment.valid?
  end

  test "statement should be present" do
    @comment.statement = "   "
    assert_not @comment.valid?
  end

  test "commented_on_type should be present" do
    @comment.commented_on_type = "   "
    assert_not @comment.valid?
  end

  test "commented_on_id should be present" do
    @comment.commented_on_id = nil
    assert_not @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
end
