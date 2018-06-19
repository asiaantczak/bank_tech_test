require 'transaction'

describe Transaction do

  describe '#create_credit_transaction' do
    it 'creates credit transaction with credit, default balance and date' do
      date = DateTime.now.strftime("%d/%m/%Y")
      expect(subject.create_credit_transaction(40)).to eq({credit: "40.00", balance: "0.00", date: date})
    end
  end

  describe '#create_debit_transaction' do
    it 'creates debit transaction with credit, default balance and date' do
      date = DateTime.now.strftime("%d/%m/%Y")
      expect(subject.create_debit_transaction(40)).to eq({debit: "40.00", balance: "0.00", date: date})
    end
  end
end
