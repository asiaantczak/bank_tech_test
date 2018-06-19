class Statement

  def print_statement(transactions)
    t_string = [print_title]
    transactions.each do |transaction|
      t_string << "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    t_string.join("")
  end

  private

  def print_title
    title = "date || credit || debit || balance\n"
  end

end
