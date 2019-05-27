class FeedbackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.feedback.subject
  #
  def feedback(feedback)
    @feedback = feedback

    mail to: "s3553665@student.rmit.edu.au",
    subject: "Received feedback"
  end
end
