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

    attachments["chelsea.jpg"] = File.read(Rails.root.join("public/images/chelsea.jpg"))
    mail :to => recever_mail, :subject => "Interesting Article"
    Rails.logger.debug "recever_mail #{recever_mail}"
  end

  def comment_added(comment)
    @article = comment.article
    @owner_name = comment.name
    mail :to => @article.user.email, :subject => "New comment for '#{@article.title}"
  end
end
