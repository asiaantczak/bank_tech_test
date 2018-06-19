require 'statement'

describe Statement do
  let(:list) do
    [{ debit: '10.00', balance: '20.00', date: '19/06/2018' },
     { credit: '30.00', balance: '30.00', date: '18/06/2018' }]
  end

  describe '#print statement' do
    it 'prints the account statement' do
      expect { subject.print_statement(list) }.to output(<<-STATEMENT).to_stdout
      date || credit || debit || balance
      19/06/2018 ||  || 10.00 || 20.00
      18/06/2018 || 30.00 ||  || 30.00
      STATEMENT
    end
  end
end
