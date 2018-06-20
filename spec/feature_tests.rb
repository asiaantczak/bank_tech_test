# irb -r './spec/feature_tests.rb'
require './lib/account'
require './lib/statement'
require './lib/transaction'
require './lib/transaction_log'

def create_credit_transaction
  transaction = Transaction.new
  p transaction.create_credit_transaction(40)
end

def create_debit_transaction
  transaction = Transaction.new
  p transaction.create_debit_transaction(40)
end

def make_deposit_on_account
  account = Account.new
  transaction_log = TransactionLog.new
  account.make_deposit(30)
  p transaction_log.transactions_list
end

def withdraw_from_account
  account = Account.new
  transaction_log = TransactionLog.new
  account.withdraw(30)
  p account[:transaction_log]
end

def print_account_statement
  account = Account.new
  statement = Statement.new
  account.make_deposit(30)
  account.withdraw(10)
  account.print_account_statement(statement)
end

create_credit_transaction
create_debit_transaction
make_deposit_on_account
withdraw_from_account
print_account_statement
