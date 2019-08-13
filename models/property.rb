require ('pg')

class Property

  attr_accessor :address, :value, :no_of_bedrooms, :year_built
  attr_reader :id

  def initialize( details )
    @address = details['address']
    @value = details['value'].to_i
    @no_of_bedrooms = details['no_of_bedrooms'].to_i
    @year_built = details['year_built']
    @id = details['id'].to_i if details['id']
  end

  def save
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "
    INSERT INTO properties
    (
      address,
      value,
      no_of_bedrooms,
      year_built
    )
    VALUES
    ($1, $2, $3, $4)
    RETURNING *
    "

    values = [@address, @value, @no_of_bedrooms, @year_built]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def update
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "
      UPDATE properties
      SET (
        address,
        value,
        no_of_bedrooms,
        year_built
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5
    "
    values = [@address, @value, @no_of_bedrooms, @year_built]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end


end
