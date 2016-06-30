require 'qt'
require 'spec_helper'
require 'add_contact_window'

describe AddContactWindow do
  let (:repository) {InMemoryContactsRepository.new}
  let (:window) {AddContactWindow.new(repository)}

  before(:all) do
    Qt::Application.new(ARGV)
  end

  def find_widget(name)
    window.children.find { |child| child.object_name == name }
  end

  describe 'layout and fields' do
    it 'is a window' do
      expect(window).to be_kind_of(Qt::Widget)
      expect(window.parent).to be_nil
    end

    it 'has a form layout' do
      expect(window.find_child(Qt::FormLayout, "Form")).to be_kind_of(Qt::FormLayout)
    end

    it 'has a default size' do
      expect(window.height).to eq(400)
      expect(window.width).to eq(400)
    end

    it 'has a first name field' do 
      expect(find_widget('first_name')).to be_kind_of(Qt::LineEdit)
    end

    it 'has a last name field' do 
      expect(find_widget('last_name')).to be_kind_of(Qt::LineEdit)
    end

    it 'has a telephone field' do 
      expect(find_widget('telephone')).to be_kind_of(Qt::LineEdit)
    end

    it 'has a D.O.B field' do 
      expect(find_widget('dob')).to be_kind_of(Qt::LineEdit)
    end

    it 'has an email field' do 
      expect(find_widget('email')).to be_kind_of(Qt::LineEdit)
    end

    it 'has an address field' do 
      expect(find_widget('address')).to be_kind_of(Qt::TextEdit)
    end
  end

  describe 'form buttons' do
    it 'has an add button' do
      expect(find_widget('Add')).to be_kind_of(Qt::PushButton)
    end

    it 'cancel button is set to default' do
      expect(find_widget('Cancel').isDefault).to be true
    end
  end

  describe 'validators' do
    it 'only allows email fields with an @ sign' do
      email = find_widget('email')
      email.setText('hi@me.com')
      email.returnPressed
      expect(window.valid_email?).to eq true 
    end

    it 'only allows a valid date to be entered' do 
      expect(window.validate("01-10-2006")).to eq "01.10.2006".to_date
    end

    it 'shows error message when invalid date entered' do
      expect(window.validate("01102006")).to eq "invalid date"
    end
  end

  describe 'creates a contact' do
    it 'allows a user to create a contact' do
      find_widget('first_name').set_text("Priya")
      find_widget('last_name').set_text("Patil")
      find_widget("Add").click
      expect(window.contacts_repository.get_all.size).to eq 1
    end
  end
end
