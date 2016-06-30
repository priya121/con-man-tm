require 'sql_contacts_repository'
require 'spec_helper'
require 'contact'

describe SQLContactsRepository do

  before (:all) do 
    @repository = SQLContactsRepository.new
    @contact = create_contact("Priya", 
                              "Patil", 
                              "04.10.1901", 
                              "123", 
                              "priya@gmail.com", 
                              "2 Cedar Way")
    @repository.add(@contact)
  end

  after (:each) do
    @repository.delete(@contact)
  end

  it 'saves a contact' do
    expect(@repository.found(@contact)).to eq true
  end

  it 'deletes a contact' do
    expect(@repository.number_of_contacts).to eq 0
  end

  it 'can find all contacts' do
    expect(@repository.get_all.size).to eq 1
  end

  private

  def create_contact(first_name, last_name, dob, telephone, email, address)
    contact = Contact.new
    contact.first_name = first_name 
    contact.last_name = last_name 
    contact.dob = dob 
    contact.telephone = telephone 
    contact.email = email 
    contact.address = address 
    contact
  end
end
