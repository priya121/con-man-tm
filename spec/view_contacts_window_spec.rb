require 'view_contacts_window'
require 'in_memory_contacts_repository'
require 'spec_helper'

describe ViewContactsWindow do
  Qt::Application.new(ARGV)
  repository = InMemoryContactsRepository.new
  window = ViewContactsWindow.new(repository)

  describe 'layout' do 

    it 'is a window' do
      expect(window).to be_kind_of(Qt::Widget)
      expect(window.parent).to be_nil
    end

    it 'has a grid layout' do
      expect(window.find_child(Qt::GridLayout, "Grid")).to be_kind_of(Qt::GridLayout)
    end

    it 'has access to a repository' do
      expect(window.repository).to be_a_kind_of(InMemoryContactsRepository)
    end
  end
end
