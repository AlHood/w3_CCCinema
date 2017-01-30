require( 'pg') 
require_relative("../db/sql_runner")



class Film

  attr_reader :id
  attr_accessor :title, :price


  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @title = options['title']
    @price = options['price'].to_i
  end


  def save
   sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', #{ @price }) RETURNING *;"
   film = SqlRunner.run( sql ).first
   @id = film['id'].to_i
 end

 def self.all
  sql = "SELECT * FROM films;"
  films = SqlRunner.run(sql)
  return films.map { |customer| Film.new(customer)}

end

def update()
  sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM films WHERE id = #{@id};"
  SqlRunner.run(sql)
end


def self.delete_all
  sql = "DELETE FROM films;"
  SqlRunner.run(sql)
end

# def return_id_by_title(title)

# end

# def customer_count
#count the number of tickets with this films id
# end



end


