require_relative './transaction'
require_relative './statement'

class Account # :nodoc:
  attr_reader :transactions_list

  def initialize
    @transactions_list = []
    @account_balance = 0
  end

  def make_deposit(amount, transaction = Transaction.new)
    update_credit_balance(amount)
    t = transaction.create_credit_transaction(amount, @account_balance)
    save_transaction(t)
  end

  def withdraw(amount, transaction = Transaction.new)
    update_debit_balance(amount)
    t = transaction.create_debit_transaction(amount, @account_balance)
    save_transaction(t)
  end

  def print_account_statement(statement = Statement.new)
    statement.print_statement(reverse_transactions_order)
  end

  private

  def reverse_transactions_order
    @transactions_list.reverse
  end

  def update_credit_balance(amount)
    @account_balance += amount
  end

  def update_debit_balance(amount)
    @account_balance -= amount
  end

  def save_transaction(transaction)
    @transactions_list << transaction
  end
end
