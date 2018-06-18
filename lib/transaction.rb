class Transaction

  attr_reader :saved_transaction

  def initialize
    @saved_transaction = {}
  end

  def add_credit(amount, balance = 0)
    @saved_transaction[:credit] = amount
    @saved_transaction[:balance] = balance += amount
  end
end
