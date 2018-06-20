require 'account'

describe Account do
  date = Time.now.strftime('%d/%m/%Y')
  let(:transaction_log) { double :transaction_log, transactions_list: [] }
  let(:account) { described_class.new(transaction_log) }
  let(:transaction) { double :transaction }

  describe '#make deposit' do
    it 'saves credit transaction on transaction log' do
      expect(transaction_log).to receive(:save_transaction)
      account.make_deposit(30)
    end

    it 'creates credit transaction' do
      expect(transaction).to receive(:create_credit_transaction)
      subject.make_deposit(30, transaction)
    end
  end

  describe '#withdraw' do
    it 'saves debit transaction on transaction log' do
      expect(transaction_log).to receive(:save_transaction)
      account.withdraw(30)
    end

    it 'creates debit transaction' do
      expect(transaction).to receive(:create_debit_transaction)
      subject.withdraw(30, transaction)
    end
  end

  describe '#account_balance' do
    it 'calculates correct balance after few transactions' do
      subject.make_deposit(30)
      subject.make_deposit(40)
      subject.withdraw(10)
      expect(subject.account_balance).to eq 60
    end
  end

  describe '#print_account_statement' do
    it 'prints all the transactions in reverse order and in seperate lines' do
      subject.make_deposit(30)
      subject.withdraw(10)
      expect { subject.print_account_statement }.to output(<<-STATEMENT).to_stdout
      date || credit || debit || balance
      #{date} ||  || 10.00 || 20.00
      #{date} || 30.00 ||  || 30.00
      STATEMENT
    end
  end
end
