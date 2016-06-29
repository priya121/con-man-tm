#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'add_contact'
require 'sql_contacts_repository'
require 'qt'

contacts_repository = SQLContactsRepository.new
app = Qt::Application.new (ARGV)
window = AddContact.new(contacts_repository)
window.show
app.exec
