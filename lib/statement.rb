class Statement

  def print_statement(transactions)
    print_title
    transactions.each do |transaction|
      puts <<-STATEMENT
      #{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}
      STATEMENT
    end
  end

  private

  def print_title
    puts <<-TITLE
      date || credit || debit || balance
    TITLE
  end

end
