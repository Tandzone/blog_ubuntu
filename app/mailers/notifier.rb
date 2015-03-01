class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(article, sender_name, recever_mail)
    @article = article
    @sender_name = sender_name
    mail :to => recever_mail, :subject => "Interesting Article"
    Rails.logger.debug "recever_mail #{recever_mail}"
  end
end
