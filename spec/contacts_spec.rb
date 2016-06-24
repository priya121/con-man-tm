require 'contacts'

describe Contacts do
  it 'can send first name to contacts database'do
    name = Contacts.find_by(first_name: 'Priya')
    expect(name.first_name).to eq 'Priya' 
  end
end
