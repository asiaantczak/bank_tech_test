class Transaction

  attr_reader :saved_transaction

  def initialize
    @saved_transaction = {}
  end

  def add_credit(amount, balance = 0)
    @saved_transaction[:credit] = amount
    @saved_transaction[:balance] = balance += amount
    @saved_transaction[:date] = DateTime.now.strftime("%d/%m/%Y")
  end

  def add_debit(amount)
    @saved_transaction[:debit] = amount
  end
end
