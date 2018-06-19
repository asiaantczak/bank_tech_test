require 'statement'

describe Statement do

  let(:transactions_list) {[{:debit=>"10.00", :balance=>"20.00", :date=>"19/06/2018"}, {:credit=>"30.00", :balance=>"30.00", :date=>"18/06/2018"}]}

  describe '#print statement' do
    it "prints the account statement" do
      expect(subject.print_statement(transactions_list)).to eq("date || credit || debit || balance\n19/06/2018 ||  || 10.00 || 20.00\n18/06/2018 || 30.00 ||  || 30.00\n")
    end
  end

end
