require 'rubygems'
require 'mysql'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "localhost",
  :database => "contacts"
)

class Contact < ActiveRecord::Base
  def name
    first_name + " " + last_name
  end
end
