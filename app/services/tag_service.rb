module TagService
  class TagCreator

    def initialize(tag_params)
      @tag_params = tag_params
    end

    def create_tags
      tag = Tag.create!(@tag_params)
    end

    def edit_tags(tag_id)
      tag = Tag.find(tag_id)
      if(tag)
        tag.label=@tag_params[:label]
        tag.body = @tag_params[:body]
        tag.save!
      end
      return tag
    end

    def self.destroy_tag(tag_id)
      tag = Tag.find(tag_id)
      tag.destroy!
    end
  end

  class TagAdder
    def self.add_tags(question_id, tag_ids)
      question = QuestionService.get_question(question_id)
      tags = TagService.get_tags(tag_ids)
      if(question && tags)
        question.tags << tags
      else
        raise "Question not found"
      end
    end

    def self.update_tags(question_id, tag_ids)
      question = QuestionService.get_question(question_id)
      tags = TagService.get_tags(tag_ids)
      if(question)
        question.tags.clear
        question.tags << tags
      else
        raise "Question not found"
      end
    end
  end

  def self.show_tags
    Tag.all
  end

  def self.get_tags(tag_ids)
    Tag.where(id: tag_ids)
  end

  def self.show(id)
    Tag.find(id)
  end
end