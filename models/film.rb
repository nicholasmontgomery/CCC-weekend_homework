require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  # def save()
  #   sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
  #   values = [@title, @price]
  #   film = SqlRunner.run(sql, values).first
  #   @id = film['id'].to_i
  # end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $4"
    values = [@title, @price]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def ticket()
  #   sql = "SELECT * FROM tickets where film_id = $1"
  #   values = [@id]
  #   ticket_data = SqlRunner.run(sql, values)
  #   return ticket_data.map{|ticket| Ticket.new(ticket)}
  # end

  # def customer()
  #   sql = "SELECT customers.*
  #   FROM customers
  #   INNER JOIN tickets
  #   ON customers.id = tickets.customer_id
  #   WHERE film_id = $1"
  #   values = [@id]
  #   customer_data = SqlRunner.run(sql, values)
  #   return Customer.map_items(customer_data)
  # end

  def most_popular_film_time()
    sql = "SELECT screenings.*
    FROM screenings
    INNER JOIN tickets
    ON screenings.id = tickets.screening_id
    WHERE film_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    array = film_data.map{|screening| Screening.new(screening)}
    time_list = array.map{|array| array.screening_time}
    return time_list.max_by {|i| time_list.count(i)}
    # return time_list.group_by(&:to_s).values.max_by(&:size)
  end

  # def screenings()
  #   sql = "SELECT *
  #   FROM screenings
  #   where film_id = $1"
  #   values = [@id]
  #   screening_data = SqlRunner.run(sql, values)
  #   return screening_data.map{|screening| Screening.new(screening_time)}
  # end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Film.map_items(film_data)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end

end
