require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

  customer1 = Customer.new({
    'name' => 'John Smith',
    'funds' => 50,
  })
  customer1.save()

  customer2 = Customer.new({
    'name' => 'Jane Smith',
    'funds' => 20,
  })
  customer2.save()

  customer3 = Customer.new({
    'name' => 'Alice Brown',
    'funds' => 5,
  })
  customer3.save()

  film1 = Film.new({
    'title' => '1917',
    'price' => 11
  })
  film1.save()

  film2 = Film.new({
    'title' => 'Jojo Rabbit',
    'price' => 7
  })
  film2.save()

  film3 = Film.new({
    'title' => 'Bombshell',
    'price' => 9
  })
  film3.save()

  ticket1 = Ticket.new({
    'customer_id' => customer1.id,
    'film_id' => film1.id,
  })
  ticket1.save()

  ticket2 = Ticket.new({
    'customer_id' => customer1.id,
    'film_id' => film2.id,
  })
  ticket2.save()

  ticket3 = Ticket.new({
    'customer_id' => customer2.id,
    'film_id' => film1.id,
  })
  ticket3.save()

  ticket4 = Ticket.new({
    'customer_id' => customer2.id,
    'film_id' => film2.id,
  })
  ticket4.save()

  binding.pry
  nil
