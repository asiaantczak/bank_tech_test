require_relative './transaction'
require_relative './statement'
require_relative './transaction_log'

class Account # :nodoc:
  attr_reader :account_balance, :transaction_log

  def initialize(transaction_log = TransactionLog.new)
    @account_balance = 0
    @transaction_log = transaction_log
  end

  def make_deposit(amount, transaction = Transaction.new)
    update_credit_balance(amount)
    add_transaction(transaction.create_credit_transaction(amount, account_balance))
  end

  def withdraw(amount, transaction = Transaction.new)
    update_debit_balance(amount)
    add_transaction(transaction.create_debit_transaction(amount, account_balance))
  end

  def print_account_statement(statement = Statement.new)
    statement.print_statement(reverse_transactions_order)
  end

  private

  def reverse_transactions_order
    transaction_log.transactions_list.reverse
  end

  def update_credit_balance(amount)
    @account_balance += amount
  end

  def update_debit_balance(amount)
    @account_balance -= amount
  end

  def add_transaction(transaction)
    transaction_log.save_transaction(transaction)
  end
end
