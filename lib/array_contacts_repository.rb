class ArrayContactsRepository 

  attr_accessor :contacts_list 

  def initialize 
    @contacts_list = []
  end

  def add(contact)
    @contacts_list << contact
  end

  def found(contact)
    @contacts_list.include?(contact)
  end

  def get_all
    @contacts_list
  end

  def delete(contact)
    if found(contact) 
      @contacts_list.delete(contact)
    end
  end
end
