require 'account'

describe Account do

  describe "initialize" do
    it "has got an empty list of transactions when initialized" do
      expect(subject.transactions_list).to eq []
    end
  end

  describe 'make deposit' do
    it 'adds credit transaction to transactions_list' do
      subject.make_deposit(30)
      expect(subject.transactions_list[0]).to eq [{credit: 30, balance: 0, date: "19/06/2018" }]
    end
  end
end
