require 'transaction_log'

describe TransactionLog do
  let(:transaction) { double :transaction }

  describe 'initialize' do
    it 'has empty array of transactions when initialized' do
      expect(subject.transactions_list).to eq []
    end
  end

  describe '#save_transaction' do
    it 'adds the transaction to transactions_list' do
      subject.save_transaction(transaction)
      expect(subject.transactions_list).to eq [transaction]
    end
  end
end
