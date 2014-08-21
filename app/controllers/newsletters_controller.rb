class NewslettersController < ApplicationController

def new
  @newsletter = Newsletter.new
end

  def create
    @newsletter = Newsletter.create(newsletter_params)
    respond_to do |format|
      if @newsletter.save
        NewsletterMailer.newsletter_email(@newsletter).deliver
        format.html { redirect_to "/admin", notice: 'Newsletter was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


private

def newsletter_params
  params.require(:newsletter).permit(:email_text, :email_subject)
end

end