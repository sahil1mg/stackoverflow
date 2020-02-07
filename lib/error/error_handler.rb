module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
          rescue_from StandardError, with: :standard_error
      end
    end

    private
    def record_not_found(_e)
      render json: _e.errors, status: :record_not_found
    end

    def standard_error(_e)
      render json: _e.to_s, status: :unprocessable_entity
    end
  end
end