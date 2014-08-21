class NewsletterRecipientsController < ApplicationController

  def new
    @newsletter_recipient = NewsletterRecipient.new
  end

  def create
  @newsletter_recipient = NewsletterRecipient.create(newsletter_recipient_params)
     respond_to do |format|
      if @newsletter_recipient.save
        # Tell the UserMailer to send a welcome email after save
        format.html { redirect_to "/signup.html", notice: 'Thank you for signing up!' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def set_newsletter_recipient
    @newsletter_recipient = NewsletterRecipient.find(params[:id])
  end


  def newsletter_recipient_params
    params.require(:newsletter_recipient).permit(:email, :first_name, :last_name, :phone, :zip)
  end

end
