require 'contacts_db'

class SQLContactsRepository

  def add(contact)
    Contacts.create(:first_name => contact.first_name,
                    :last_name => contact.last_name,
                    :dob => contact.dob,
                    :telephone => contact.telephone,
                    :email => contact.email,
                    :address => contact.address)
  end

  def found(contact)
    Contacts.exists?(last_name: contact.last_name)
  end

  def delete(contact)
    Contacts.where(last_name: contact.last_name).destroy_all
  end

  def number_of_contacts 
    Contacts.count
  end

  def get_all
    [] << Contacts.find_each
  end
end
