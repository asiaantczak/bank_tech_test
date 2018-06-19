# irb -r './spec/feature_tests.rb'

require './lib/transaction'
require './lib/account'

transaction = Transaction.new
account = Account.new

def add_credit_transaction
  transaction = Transaction.new
  transaction.add_credit(40)
  p transaction.saved_transaction[0][:credit]
  p transaction.saved_transaction[0][:balance]
  p transaction.saved_transaction[0][:date]
end

def add_debit_transaction
  transaction = Transaction.new
  transaction.add_debit(40)
  p transaction.saved_transaction[0][:debit]
  p transaction.saved_transaction[0][:balance]
  p transaction.saved_transaction[0][:date]
end

def make_deposit
  account = Account.new
  transaction = Transaction.new
  p transactions_list.credit
end

add_credit_transaction
add_debit_transaction
