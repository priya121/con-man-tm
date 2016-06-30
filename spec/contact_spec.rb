require 'contact'
require 'spec_helper'

describe Contact do
  let (:contact) {Contact.new}

  it 'has a first name' do
    contact.first_name = "Priya"
    expect(contact.first_name).to eq "Priya"
  end

  it 'has a last name' do
    contact.last_name = "Patil"
    expect(contact.last_name).to eq "Patil"
  end

  it 'combines the first and last name' do
    contact.first_name = "Priya"
    contact.last_name = "Patil"
    expect(contact.name).to eq "Priya Patil"
  end

  it 'has a dob' do
    contact.dob = "04.10.1901"
    expect(contact.dob).to eq "04.10.1901".to_date
  end

  it 'has a telephone number' do
    contact.telephone = "123"
    expect(contact.telephone).to eq "123"
  end

  it 'has an email' do
    contact.email = "123@gmail.com"
    expect(contact.email).to eq "123@gmail.com"
  end

  it 'has an address' do
    contact.address = "2 Cedar Way"
    expect(contact.address).to eq "2 Cedar Way"
  end
end
