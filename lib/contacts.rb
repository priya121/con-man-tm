require 'rubygems'
require 'mysql'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "localhost",
  :database => "contacts"
)

class Contacts < ActiveRecord::Base
end

