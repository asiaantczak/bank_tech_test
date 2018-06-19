class Account

  attr_reader :transactions_list

  def initialize
    @transactions_list = []
  end

  def make_deposit(amount)
    transaction = Transaction.new
    @transactions_list << transaction.add_credit(amount)
  end

end
