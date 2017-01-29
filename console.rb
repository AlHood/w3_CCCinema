require('pry-byebug')
require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/film')
require_relative('db/sql_runner')



testcustomer = Customer.new('name' => "TestBill", 'funds' => 1337)
testfilm = Film.new('title' => "Test Film" , 'price' => 420 )

testcustomer.save
testfilm.save 


testticket = Ticket.new( 'customer_id' => testcustomer.id , 'film_id' => testfilm.id)

testticket.save 






binding.pry

nil































