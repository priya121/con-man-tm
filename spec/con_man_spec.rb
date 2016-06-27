require 'qt'
require 'con_man'

describe ConMan do
    Qt::Application.new(ARGV)
    let (:window) {ConMan.new}

    def find_widget(name)
      window.children.find { |child| child.object_name == name }
    end

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
    expect(find_widget('Telephone')).to be_kind_of(Qt::LineEdit)
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

  it 'has an add button' do
    expect(find_widget('Add')).to be_kind_of(Qt::PushButton)
  end

  it 'cancel button is set to default' do
    expect(find_widget('Cancel').isDefault).to be true
  end

  xit 'only allows email fields with an @ sign' do
    expect(find_widget('Cancel').text("hi")).to be true
  end
end


