class FeedbacksController < ApplicationController
    
    def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save
    FeedbackMailer.feedback(@feedback).deliver_now
    end
    
    private
    
    def feedback_params
        params.require(:feedback).permit(:body)
    end
end