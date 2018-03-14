class CustomerMailsControllerTest < ActionDispatch::IntegrationTest
def preview_information_mailenvironments/development.rb
  subject = params[:subject]　#フォームで入力された値の取得　
  mail_to = params[:mail_to]　#フォームで入力された値の取得
  name = params[:name]
  message = params[:message]　#フォームで入力された値の取得
  @mail = UserMailer.information_mail(subject, mail_to, name, message)
end
