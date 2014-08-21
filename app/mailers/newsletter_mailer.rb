class NewsletterMailer < ActionMailer::Base
  default from: "emma.ife@flatironschool.com"

  def newsletter_email(newsletter)
    @newsletter_recipients = NewsletterRecipient.all
    @newsletter = newsletter
    mail(to: @newsletter_recipients.pluck(:email), subject: @newsletter.email_subject, body: @newsletter.email_text)
  end

end
