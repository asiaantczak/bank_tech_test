class TransactionLog

  attr_reader :transactions_list

  def initialize
    @transactions_list = []
  end

  def save_transaction(transaction)
    @transactions_list << transaction
  end

end
