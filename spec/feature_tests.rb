# irb -r './spec/feature_tests.rb'

require './lib/transaction'

transaction = Transaction.new

def add_credit_transaction
  transaction = Transaction.new
  transaction.add_credit(40)
  p transaction.saved_transaction[:credit]
  p transaction.saved_transaction[:balance]
  p transaction.saved_transaction[:date]
end

add_credit_transaction
