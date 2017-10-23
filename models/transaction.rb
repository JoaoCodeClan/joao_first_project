class Transaction

attr_reader(:id)
attr_accessor(:amount, :date, :merchant_id, :tag_id)

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_i
    @date = transaction['date']
    @merchant_id = transaction['merchant_id'].to_i
    @tag_id = transsaction['tag_id'].to_i
  end

  def save()
    sql = " INSERT INTO transactions(amount, date, merchant_id, tag_id) VALUES($1, $2, $3, $4) RETURNING id"
    values = [@amount, @date, @merchant_id, @tag_id]

    transaction = SqlRunner.run(sql,values)

    @id = tag.first['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql,values)

    return transactions.map {|transaction| Transaction.new(transaction)}

  end

  def delete()
    sql = " DELETE * FROM transactions WHERE id= $1"
    values = [@id]

    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = " DELETE * FROM transactions"
    values = []

    SqlRunner.run(sql,values)
  end

end
