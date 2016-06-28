require 'contacts'

describe Contacts do
  let (:window) {ConMan.new}

  before(:all) do
    Qt::Application.new(ARGV)
  end

  def find_widget(name)
    window.children.find { |child| child.object_name == name }
  end

  def create_contact(first_name, last_name, dob, email, tel, address)
    find_widget("first_name").setText("Priya")
    find_widget("last_name").setText("Patil")
    find_widget("dob").setText("04.10.1987")
    find_widget("telephone").setText("123")
    find_widget("email").setText("abc@me.com")
    find_widget("Add").click
  end

  it 'can send name field to contacts database'do
    create_contact("Priya", "Patil", "04.10.1987", "123", "abc@me.com", "2 Cedar Way")
    name = Contacts.find_by(first_name: 'Priya')
    expect(name.first_name).to eq 'Priya' 
  end

  it 'can send last name field to contacts database' do
    name = Contacts.find_by(last_name: 'Patil')
    expect(name.last_name).to eq 'Patil' 
  end

  it 'can send telephone field to contacts database' do
    name = Contacts.find_by(telephone: '123')
    expect(name.telephone).to eq '123' 
  end

  it 'can send dob field to contacts database' do
    name = Contacts.find_by(dob: "1987-10-04")
    expect(name.dob).to eq 'Sun, 04 Oct 1987'.to_date
  end
end
