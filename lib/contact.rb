class Contact

  attr_accessor :first_name, :last_name, :dob, :telephone, :email, :address

  def name
    first_name + " " + last_name
  end
end
