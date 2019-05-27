# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feedback_mailer/feedback
  def feedback
    feedback = Feedback.last
    FeedbackMailer.feedback(feedback)
  end

end
