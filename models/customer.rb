require( 'pg') 
require_relative("../db/sql_runner")



class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options) 
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @funds = options ['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', #{ @funds }) RETURNING *;"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end


  def self.all
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end


  def update()
sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
 SqlRunner.run(sql)
  end
 

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end





def buy_ticket(film_title)
sql = "SELECT FROM films WHERE title = #{film_title} RETURNING id;"

local_film_id = SqlRunner.run
# mmm, haow to ticket.new without a static name
new_ticket = Ticket.new(@id, local_film_id)
new_ticket.save

sql = "SELECT FROM films WHERE title =  #{film_title} RETURNING price;"
@funds -= price
@customer.update
end

end

# def buy_ticket(film) 
# ticket.new (customer, film)
# adjust funds by film.price
# update customer
# end

# # def ticket_count()
# search tickets for matching customer id
# return as array with .map
# .count them
# # end




# def self.find(ident)
#   sql = "SELECT * FROM albums WHERE id = #{ident.to_i};"
#   result1 = SqlRunner.run(sql).first
#   result2 = Album.new( result1 )
#   return result2 
# end
