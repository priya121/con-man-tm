require 'view_contacts_window'
require 'in_memory_contacts_repository'
require 'spec_helper'

describe ViewContactsWindow do
  Qt::Application.new(ARGV)
  repository = InMemoryContactsRepository.new
  contact = Contact.new
  contact.first_name = "Priya"
  repository.add(contact)
  window = ViewContactsWindow.new(repository)

  describe 'layout' do 

    it 'is a window' do
      expect(window).to be_kind_of(Qt::Widget)
      expect(window.parent).to be_nil
    end

    it 'has a grid layout' do
      expect(window.find_child(Qt::TableWidget, "Table")).to be_kind_of(Qt::TableWidget)
    end

    it 'has access to a repository' do
      expect(window.repository).to be_a_kind_of(InMemoryContactsRepository)
    end

    it 'has three rows' do
      expect(window.find_child(Qt::TableWidget, "Table").rowCount).to eq 3
      expect(window.find_child(Qt::TableWidget, "Table").columnCount).to eq 3
    end

    it 'can access a contact to display' do
      window.repository.add(contact)
      expect(window.repository.get_all[0].first_name).to eq("Priya")
    end

    it 'has a contact on the first row' do
      expect(window.find_child(Qt::TableWidget, "Table").takeItem(0,0).text).to include "Priya"
    end
  end
end
