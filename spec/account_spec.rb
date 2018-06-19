require 'account'

describe Account do

  date = DateTime.now.strftime("%d/%m/%Y")

  describe "initialize" do
    it "has got an empty list of transactions when initialized" do
      expect(subject.transactions_list).to eq []
    end
  end

  describe '#make deposit' do
    it 'adds credit transaction to transactions_list' do
      subject.make_deposit(30, 30)
      expect(subject.transactions_list[0]).to eq [{credit: 30, balance: 30, date: date }]
    end

    it 'updates transaction balance on the list' do
      subject.make_deposit(30, 30)
      expect(subject.transactions_list[0]).to eq [{credit: 30, balance: 30, date: date }]
    end
  end

  describe '#withdraw' do
    it 'adds debit to transaction' do
      subject.withdraw(30,-30)
      expect(subject.transactions_list[0]).to eq [{debit: 30, balance: -30, date: date }]
    end
  end

  describe 'balance' do
    it 'calculates correct balance for different transactions' do
      balance = 0
      subject.make_deposit(30, balance)
      subject.make_deposit(40, balance)
      subject.withdraw(10, balance)
      expect(subject.transactions_list.last).to eq [{debit: 10, balance: 60, date: date}]
    end
  end

end
