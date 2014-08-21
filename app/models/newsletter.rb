class Newsletter < ActiveRecord::Base
  after_save :send_newsletter

  def send_newsletter
 NewsletterMailer.newsletter_email(Newsletter.all.last).deliver
   end

end
