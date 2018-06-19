require_relative './transaction'
require_relative './statement'

class Account

  attr_reader :transactions_list

  def initialize
    @transactions_list = []
    @account_balance = 0
  end

  def make_deposit(amount, balance)
    @account_balance += amount
    transaction = Transaction.new
    @transactions_list << transaction.add_credit(amount, @account_balance)
  end

  def withdraw(amount, balance)
    @account_balance -= amount
    transaction = Transaction.new
    @transactions_list << transaction.add_debit(amount, @account_balance)
  end

  def print_account_statement(statement = Statement.new)
    list = @transactions_list.reverse.flatten
    statement.print_statement(list)
  end

end
