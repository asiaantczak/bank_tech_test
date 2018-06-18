require 'account'

describe Account do

  describe "initialize" do
    it "has got an empty list of transactions when initialized" do
      expect(subject.transactions_list).to eq []
    end
  end
end
