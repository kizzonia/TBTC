class Withdraw < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file,      :attachment => true
  attribute :account_number
  attribute :amount
  attribute :bitcoin_address
  attribute :nickname,  :captcha  => true

# Declare the e-mail headers. It accepts anything the mail method
# in ActionMailer accepts.

def headers
    {
      :subject => "Withdrawal Request ",
      :to => "payment@tradebitr.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
