require 'transaction'

describe Transaction do

  describe 'initalize' do
    it 'has empty saved transaction property when initialized' do
      expect(subject.saved_transaction).to eq []
    end
  end

  describe '#add_credit' do
    it 'adds a credit when client pay the money in' do
      subject.add_credit(40)
      expect(subject.saved_transaction[0][:credit]).to eq "40.00"
    end

    it 'adds a passed balance when client pay the money in' do
      subject.add_credit(40, 40)
      expect(subject.saved_transaction[0][:balance]).to eq "40.00"
    end

    it 'adds a date to the transaction' do
      date = DateTime.now.strftime("%d/%m/%Y")
      subject.add_credit(40)
      expect(subject.saved_transaction[0][:date]).to eq date
    end
  end

  describe "#add_debit" do
    it 'adds a debit when client pay the money out' do
      subject.add_debit(40)
      expect(subject.saved_transaction[0][:debit]).to eq "40.00"
    end

    it 'adds a balance when client pay the money out' do
      subject.add_debit(40, -40)
      expect(subject.saved_transaction[0][:balance]).to eq "-40.00"
    end

    it 'adds a date to the transaction' do
      date = DateTime.now.strftime("%d/%m/%Y")
      subject.add_debit(40)
      expect(subject.saved_transaction[0][:date]).to eq date
    end
  end


end
