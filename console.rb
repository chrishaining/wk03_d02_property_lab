require('pry')
require_relative('./models/property')

Property.delete_all

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

    property1.no_of_bedrooms = '12'
    property1.update()

    Property.find(15)
    Property.find_by_address('29 Acacia Road')

    binding.pry
    nil
