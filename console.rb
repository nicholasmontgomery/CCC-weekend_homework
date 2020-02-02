require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Screening.delete_all()
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

  screening1 = Screening.new({
    'screening_time' => '19.30',
    'film_id' => film1.id
  })
  screening1.save()

  screening2 = Screening.new({
    'screening_time' => '22.00',
    'film_id' => film2.id
  })
  screening2.save()

  screening3 = Screening.new({
    'screening_time' => '18.00',
    'film_id' => film1.id
  })
  screening3.save()

  screening4 = Screening.new({
    'screening_time' => '21.00',
    'film_id' => film2.id
  })
  screening4.save()

  ticket1 = Ticket.new({
    'customer_id' => customer1.id,
    'screening_id' => screening1.id
  })
  ticket1.save()

  ticket2 = Ticket.new({
    'customer_id' => customer1.id,
    'screening_id' => screening3.id
  })
  ticket2.save()

  ticket3 = Ticket.new({
    'customer_id' => customer2.id,
    'screening_id' => screening1.id
  })
  ticket3.save()

  ticket4 = Ticket.new({
    'customer_id' => customer2.id,
    'screening_id' => screening4.id
  })
  ticket4.save()

  binding.pry
  nil
