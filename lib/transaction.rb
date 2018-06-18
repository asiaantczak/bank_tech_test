class Transaction

  attr_reader :saved_transaction

  def initialize
    @saved_transaction = {}
  end

  def add_credit(amount)
    @saved_transaction[:credit] = amount
  end
end
