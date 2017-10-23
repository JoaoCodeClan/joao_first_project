class tag

  attr_reader(:id)
  attr_accessor(:type_of_buy)

  def initialize(tag)
    @id= tag['id'].to_i if tag['id']
    @type_of_buy = tag['type_of_buy']

  end


  def save()
    sql = " INSERT INTO tags(type_of_buy) VALUES($1) RETURNING id"
    values = [@type_of_buy]

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
    sql = " DELETE * FROM tags WHERE id= $1"
    values = [@id]

    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = " DELETE * FROM tags"
    values = []

    SqlRunner.run(sql,values)
  end


end
