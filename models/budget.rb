require_relative("../db/sql_runner.rb")

class Budget


  attr_accessor(:budget)

  def initialize(monthly_budget)
    @id= monthly_budget['id'].to_i if monthly_budget['id']
    @budget= monthly_budget['budget'].to_i
  end

  def save()
    sql = " INSERT INTO budgets(budget) VALUES($1) RETURNING id"
    values = [@budget]

    budget = SqlRunner.run(sql,values)

    @id = budget.first['id'].to_i

  end

  def update()
    sql = " UPDATE budgets set(budget)=($1) WHERE id = $2"
    values = [@budget, @id]

    SqlRunner.run(sql,values)

  end

  def delete()
    sql = " DELETE  FROM budgets WHERE id= $1"
    values = [@id]

    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = " DELETE FROM budgets"
    values = []

    SqlRunner.run(sql,values)
  end

 def self.budget()
return @budget.to_f
 end
end
