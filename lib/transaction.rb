require 'date'

class Transaction

  def create_credit_transaction(amount, balance = 0)
    { credit: '%.2f' % amount, balance: '%.2f' % balance, date: date }
  end

  def create_debit_transaction(amount, balance = 0)
    { debit: '%.2f' % amount, balance: '%.2f' % balance, date: date}
  end

  private

  def date
    DateTime.now.strftime("%d/%m/%Y")
  end
end
