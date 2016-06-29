require 'array_contacts_repository'
require 'spec_helper'

describe ArrayContactsRepository do
  let (:repository) {ArrayContactsRepository.new}
  let (:contact) {Contact.new}

  it 'holds a contact as an array' do
    repository.add(contact)
    expect(repository.found(contact)).to eq true
  end

  it 'can return a whole list of contacts' do 
    repository.add(contact)
    expect(repository.get_all.size).to eq 1
  end
end
