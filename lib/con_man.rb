require 'qt'
require 'spec_helper'
require 'contacts'

class ConMan < Qt::Widget 
  slots :click, :pressed

  def initialize
    super(nil)
    self.setWindowTitle("Add Contacts")
    layout = create_window_layout
    create_fields(layout)
    create_buttons(layout)
    setLayout(layout)
  end

  def create_fields(layout)
    create_name_field(layout)
    create_date_field(layout)
    create_tel_no(layout)
    create_email(layout)
    create_address(layout)
  end

  def create_buttons(layout)
    add_button = create_add_button
    layout.insertRow(7, add_button, create_cancel_button)
    connect_add_button(add_button)
  end

  def connect_add_button(add_button)
    connect(add_button, SIGNAL(:clicked), self, SLOT(:click))
  end
  
  def create_field(name)
    button = Qt::PushButton.new(name)
    button.object_name = name 
    button
  end

  def create_add_button
    create_field("Add")
  end

  def create_cancel_button
    cancel_button = create_field("Cancel")
    cancel_button.setDefault(true)
    cancel_button
  end

  def create_window_layout 
    self.resize(400, 400)
    layout = Qt::FormLayout.new
    layout.object_name = "Form"
    layout
  end

  def create_name_field(layout)
    name_label = Qt::Label.new "Name:"
    @name_text_box = Qt::LineEdit.new self
    @name_text_box.object_name = "name"
    layout.addRow(name_label, @name_text_box)
  end

  def create_tel_no(layout)
    name_label = Qt::Label.new "Telephone:"
    @tel_text_box = Qt::LineEdit.new self
    @tel_text_box.object_name = "Telephone"
    layout.addRow(name_label, @tel_text_box)
  end

  def create_date_field(layout)
    date_label = Qt::Label.new "DOB:"
    @dob = Qt::LineEdit.new self
    @dob.object_name = "dob"
    layout.addRow(date_label, @dob)
  end

  def create_address(layout)
    address_label = Qt::Label.new "Address:"
    @multi_line_text_box = Qt::TextEdit.new(self)
    @multi_line_text_box.object_name = "address"
    layout.addWidget(address_label)
    layout.addWidget(@multi_line_text_box)
  end

  def create_email(layout)
    email_label = Qt::Label.new "Email:"
    @email = Qt::LineEdit.new self
    reg_ex = Qt::RegExp.new("\\b(@)\\b")
    @email.object_name = "email"
    layout.addRow(email_label, @email)
  end

  def click
    Contacts.create(:first_name => @name_text_box.text)
  end
end

