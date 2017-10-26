class Tag

  attr_reader(:id)
  attr_accessor(:type_of_purchase)

  def initialize(tag)
    @id= tag['id'].to_i if tag['id']
    @type_of_purchase = tag['type_of_purchase']
  end

  def save()
    sql = " INSERT INTO tags(type_of_purchase) VALUES($1) RETURNING id"
    values = [@type_of_purchase]
    tag = SqlRunner.run(sql,values)
    @id = tag.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    tags = SqlRunner.run(sql,values)
    return tags.map {|tag| Tag.new(tag)}
  end

  def delete()
    sql = " DELETE  FROM tags WHERE id= $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = " DELETE FROM tags"
    values = []
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = " SELECT * FROM tags WHERE id=$1"
    values = [id]
    tag_result = SqlRunner.run(sql,values)
    return Tag.new(tag_result.first)
  end

  def update()
    sql = " UPDATE tags set(type_of_purchase)=($1) WHERE id = $2"
    values = [@type_of_purchase, @id]
    SqlRunner.run(sql,values)

  end

  def spent()
    sql = "SELECT SUM(amount) FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id
    WHERE tags.id = $1"
    values = [@id]
    results_array = SqlRunner.run(sql,values)
    return results_array.first['sum'].to_f
  end

end
