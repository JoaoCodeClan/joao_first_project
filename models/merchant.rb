require_relative("../db/sql_runner.rb")


class Merchant

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(merchant)
    @id= merchant['id'].to_i if merchant['id']
    @name= merchant['name']

  end


  def save()
    sql = " INSERT INTO merchants(name) VALUES($1) RETURNING id"
    values = [@name]

    merchant = SqlRunner.run(sql,values)

    @id = merchant.first['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM merchants"
    values = []
    merchants = SqlRunner.run(sql,values)

    return merchants.map {|merchant| Merchant.new(merchant)}

  end

  def delete()
    sql = " DELETE * FROM merchants WHERE id= $1"
    values = [@id]

    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = " DELETE * FROM merchants"
    values = []

    SqlRunner.run(sql,values)
  end



end
