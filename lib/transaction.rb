require 'date'

class Transaction

  attr_reader :saved_transaction

  def initialize
    @saved_transaction = []
  end

  def add_credit(amount, balance = 0)
    @saved_transaction << { credit: '%.2f' % amount, balance: '%.2f' % balance, date: date}
  end

  def add_debit(amount, balance = 0)
    @saved_transaction << { debit: '%.2f' % amount, balance: '%.2f' % balance, date: date}
  end

  def date
    DateTime.now.strftime("%d/%m/%Y")
  end
end
