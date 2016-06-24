require 'qt'
require 'read'

describe Read do
  it 'reads from the contacts list' do
    name = Contacts.find_by(first_name: 'Priya')
  end
end
