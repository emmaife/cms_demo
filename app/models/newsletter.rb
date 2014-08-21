class Newsletter < ActiveRecord::Base
  after_save :send_newsletter

  def send_newsletter   #sends newsletter after it is saved
    NewsletterMailer.newsletter_email(Newsletter.all.last).deliver
  end

end
