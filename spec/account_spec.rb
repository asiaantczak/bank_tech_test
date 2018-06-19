require 'account'

describe Account do

  date = DateTime.now.strftime("%d/%m/%Y")

  describe 'initialize' do
    it 'has got an empty list of transactions when initialized' do
      expect(subject.transactions_list).to eq []
    end
  end

  describe '#make deposit' do
    it 'adds credit transaction to transactions_list' do
      subject.make_deposit(30)
      expect(subject.transactions_list[0]).to eq [{credit: "30.00", balance: "30.00", date: date }]
    end

    it 'updates transaction balance on the list' do
      subject.make_deposit(30)
      expect(subject.transactions_list[0]).to eq [{credit: "30.00", balance: "30.00", date: date }]
    end
  end

  describe '#withdraw' do
    it 'adds debit to transaction' do
      subject.withdraw(30)
      expect(subject.transactions_list[0]).to eq [{debit: "30.00", balance: "-30.00", date: date }]
    end
  end

  describe 'balance' do
    it 'calculates correct balance for different transactions' do
      subject.make_deposit(30)
      subject.make_deposit(40)
      subject.withdraw(10)
      expect(subject.transactions_list.last).to eq [{debit: "10.00", balance: "60.00", date: date}]
    end
  end

  describe '#print_account_statement' do
    it "prints all the transactions in reverese order and in seperate lines" do
      subject.make_deposit(30)
      subject.withdraw(10)
      expect(subject.print_account_statement).to eq "date || credit || debit || balance\n19/06/2018 ||  || 10.00 || 20.00\n19/06/2018 || 30.00 ||  || 30.00\n"
    end
  end

end
