# irb -r './spec/feature_tests.rb'

require './lib/transaction'

transaction = Transaction.new

def add_credit_transaction
  transaction = Transaction.new
  transaction.add_credit(40)
  p transacion.saved_transaction[:credit]
end
