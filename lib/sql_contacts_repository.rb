require 'contact'

class SQLContactsRepository

  def add(contact)
    Contact.create(:first_name => contact.first_name,
    :last_name => contact.last_name,
    :dob => contact.dob,
    :telephone => contact.telephone,
    :email => contact.email,
    :address => contact.address, 
    :id => get_all.size)
  end

  def found(contact)
    Contact.exists?(last_name: contact.last_name)
  end

  def delete(contact)
    Contact.where(id: contact.id).destroy_all
  end

  def number_of_contacts 
    Contact.count
  end

  def get_all
     Contact.select do |contact|
       contact
     end
  end
end
