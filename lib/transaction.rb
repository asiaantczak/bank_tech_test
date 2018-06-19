require 'date'

class Transaction

  attr_reader :saved_transaction

  def initialize
    @saved_transaction = []
  end

  def add_credit(amount, balance = 0)
    @saved_transaction << { credit: amount, balance: balance, date: DateTime.now.strftime("%d/%m/%Y")}
  end

  def add_debit(amount, balance = 0)
    @saved_transaction << { debit: amount, balance: balance, date: DateTime.now.strftime("%d/%m/%Y")}
  end
end
