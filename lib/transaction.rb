require 'date'

class Transaction # :nodoc:
  def create_credit_transaction(amount, balance = 0)
    { credit: format('%.2f', amount), balance: format('%.2f', balance), date: date }
  end

  def create_debit_transaction(amount, balance = 0)
    { debit: format('%.2f', amount), balance: format('%.2f', balance), date: date }
  end

  private

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
