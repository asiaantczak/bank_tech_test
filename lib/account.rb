require_relative './transaction'
require_relative './statement'

class Account

  attr_reader :transactions_list

  def initialize
    @transactions_list = []
    @account_balance = 0
  end

  def make_deposit(amount, transaction = Transaction.new)
    @account_balance += amount
    @transactions_list << transaction.create_credit_transaction(amount, @account_balance)
  end

  def withdraw(amount, transaction = Transaction.new)
    @account_balance -= amount
    @transactions_list << transaction.create_debit_transaction(amount, @account_balance)
  end

  def print_account_statement(statement = Statement.new)
    statement.print_statement(reverse_transactions_order)
  end

  private

  def reverse_transactions_order
    @transactions_list.reverse
  end
end
