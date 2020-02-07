class CommentService

  def initialize(comment_params)
    @comment_params = comment_params
  end

  def submit_comment
    comment = Comment.new(@comment_params)
    comment.save!
    return comment
  end

  def get_comments
    commentable_type = comment_params[:commentable_type]
    commentable_id = comment_params[:commentable_id]
    Comment.where(commentable_type: commentable_type, commentable_id: commentable_id)
  end

  def edit_text(comment_id)
    comment = Comment.find(comment_id)
    if(comment)
      comment.text = @comment_params[:text]
      comment.save!
    end
    return comment
  end

  def destroy_comment(comment_id)
    comment = Comment.find(comment_id)
    comment.destroy!
  end
end