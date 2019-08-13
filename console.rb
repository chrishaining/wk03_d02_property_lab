require('pry')
require_relative('./models/property')

property1 = Property.new({
  'address' => '112b Baker Street',
  'value' => '999999',
  'no_of_bedrooms' => '11',
  'year_built' => '2064'
  })

  property2 = Property.new({
    'address' => '29 Acacia Road',
    'value' => '20',
    'no_of_bedrooms' => '1',
    'year_built' => '1984'
    })

    property1.save
    property2.save

    binding.pry
    nil
