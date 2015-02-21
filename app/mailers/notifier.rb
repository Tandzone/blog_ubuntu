class Notifier < ActionMailer::Base
  default from: "itanjn@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(article, sender_name, recever_mail)
    @article = article
    @sender_name = sender_name
    mail :to => recever_mail, :subject => "Interesting Article"
  end
end
