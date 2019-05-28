class FeedbacksController < ApplicationController
    
    def create
    @feedback = Feedback.new(feedback_params)
     if @feedback.save
       FeedbackMailer.feedback(@feedback).deliver
       flash[:success] = "Feedback sent"
       reload
     end
    end
    
    private
    
    def feedback_params
        params.require(:feedback).permit(:body)
    end
end