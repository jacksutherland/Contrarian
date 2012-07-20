class SubmissionNotifier < ActionMailer::Base
  default from: "simplecontrarian@southtunnel.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.submission_notifier.contrarian.subject
  #
  def contrarian(c)
    @contrarian = c

    mail to: "jacksutherl@gmail.com", subject: 'New Contrarian Submission'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.submission_notifier.quote.subject
  #
  def quote(q)
    @quote = q

    mail to: "jacksutherl@gmail.com", subject: 'New Quote Submission'
  end
end
