require 'transaction'

describe Transaction do

  describe 'initalize' do
    it 'has empty saved transaction property when initialized' do
      expect(subject.saved_transaction).to eq({})
    end
  end

end
