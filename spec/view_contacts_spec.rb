require 'view_contacts'
require 'array_contacts_repository'
require 'spec_helper'

describe ViewContacts do
  Qt::Application.new(ARGV)
  repository = ArrayContactsRepository.new
  window = ViewContacts.new(repository)

  describe 'layout' do 

    it 'is a window' do
      expect(window).to be_kind_of(Qt::Widget)
      expect(window.parent).to be_nil
    end

    it 'has a grid layout' do
      expect(window.find_child(Qt::GridLayout, "Grid")).to be_kind_of(Qt::GridLayout)
    end

    it 'has access to a repository' do
      expect(window.repository).to be_a_kind_of(ArrayContactsRepository)
    end
end
