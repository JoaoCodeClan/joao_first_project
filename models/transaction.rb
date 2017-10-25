require_relative('budget.rb')
require_relative('tag.rb')
require_relative('merchant.rb')

class Transaction

  attr_reader(:id)
  attr_accessor(:amount, :date_of_transaction, :merchant_id, :tag_id, :budget_id)

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_i
    @date_of_transaction = transaction['date_of_transaction']
    @merchant_id = transaction['merchant_id'].to_i
    @tag_id = transaction['tag_id'].to_i
    @budget_id = transaction['budget_id'].to_i
  end

  def save()
    sql = " INSERT INTO transactions(amount, date_of_transaction, merchant_id, tag_id, budget_id) VALUES($1, $2, $3, $4, $5) RETURNING id"
    values = [@amount, @date_of_transaction, @merchant_id, @tag_id, @budget_id]

    transaction = SqlRunner.run(sql,values)

    @id = transaction.first['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql,values)

    return transactions.map {|transaction| Transaction.new(transaction)}

  end

  def delete()
    sql = " DELETE  FROM transactions WHERE id= $1"
    values = [@id]

    SqlRunner.run(sql,values)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql,values)
    return Merchant.new(results.first).name()
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run(sql,values)
    return Tag.new(results.first).type_of_purchase()
  end


  def self.delete_all()
    sql = " DELETE FROM transactions"
    values = []

    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = " SELECT * FROM transactions WHERE id=$1"
    values = [id]

    transaction_result = SqlRunner.run(sql,values)

    return Transaction.new(transaction_result.first)
  end

  def update()
    sql = " UPDATE transactions set(amount, date_of_transaction, merchant_id, tag_id, budget_id)=($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@amount, @date_of_transaction, @merchant_id, @tag_id,@budget_id, @id]

    SqlRunner.run(sql,values)

  end

  def self.total_spent()
    sql = "SELECT SUM(amount) FROM transactions"
    values = []
    result = SqlRunner.run(sql,values)


    total_array = result.first['sum'].to_f

  end

  def self.transactions_by_tag_id(tag_id)
    sql = "SELECT * FROM transactions where tag_id= $1 "
    values = [tag_id]

    result_array = SqlRunner.run(sql,values)

    return result_array.map {|transaction| Transaction.new(transaction)}

  end

  def self.transactions_by_merchant_id(merchant_id)
    sql = "SELECT * FROM transactions where merchant_id= $1 "
    values = [merchant_id]

    result_array = SqlRunner.run(sql,values)

    return result_array.map {|transaction| Transaction.new(transaction)}

  end

  def budget()
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [@budget_id]
    results = SqlRunner.run(sql,values)
    return Budget.new(results.first).budget()
  end

  # def self.month_expenses(month)
  #   # sql = "SELECT SUM(amount) FROM transactions WHERE MONTHNAME()= $1  "
  #   sql = "{ fn MONTHNAME(OrderDate) } AS MonthName, YEAR(OrderDate) AS Year, SUM(amount)
  #   FROM transactions
  #   values = [month]
  #   results_array = SqlRunner.run(sql,values)
  #
  #   return results_array.first['sum'].to_f
  #
  # end

end
