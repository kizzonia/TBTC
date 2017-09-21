namespace :accounts do
  desc "Rake Task to Auto Increment"
  task :increment => :environment do
    accounts = Account.all
    accounts.each do |account|
      divider = account.balance * 0.01
      newBalance = account.balance + divider
      account.update!(balance: newBalance )
    end
  end
end
