class UserDepositMailer < ApplicationMailer
  default :from => "payment@tradebitr.com"
 def deposit_email(user, deposit)
   @user = user
   @deposit = deposit
    mail(to: user.email, subject: 'Deposit Order Created')
 end
end
