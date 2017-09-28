namespace :accounts do
  desc "Rake Task to Auto Increment"
  task :increment => :environment do
    accounts = Account.all.includes(:transactions)
    accounts.each do |account|
      if account.transactions.present?
      account.transactions.each do |t|
        if t.transaction_type = "deposit"
            @divider = t.amount * 0.01
          end
        end
      newBalance = account.balance + @divider
      account.update!(balance: newBalance )
      puts "Increment Of Account balance by 1% done"
    end
  end
  end
end
