require 'transaction'

describe Transaction do

  describe 'initalize' do
    it 'has empty saved transaction property when initialized' do
      expect(subject.saved_transaction).to eq({})
    end
  end

  describe '#add_credit' do
    it 'adds a credit when client pay the money in' do
      subject.add_credit(40)
      expect(subject.saved_transaction[:credit]).to eq 40
    end

    it 'adds a balance when client pay the money in' do
      subject.add_credit(40)
      expect(subject.saved_transaction[:balance]).to eq 40
    end

    it 'adds a date to the transaction' do
      date = DateTime.now.strftime("%d/%m/%Y")
      subject.add_credit(40)
      expect(subject.saved_transaction[:date]).to eq date
    end
  end

end
