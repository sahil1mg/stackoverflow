require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @vote = votes(:one)
    @wrong_vote = votes(:two)
  end

  test"vote should be valid" do
    assert @vote.valid?
  end

  test "vote is voted_on_type is not Question or Answer" do
    assert_not @wrong_vote.valid?
  end
end
