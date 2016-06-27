require 'qt'
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
    create_field("first_name", "First Name:", layout)
    create_field("last_name", "Last Name:", layout)
    create_field("dob", "DOB:", layout)
    create_field("telephone", "Telephone:", layout)
    create_field("email", "Email:", layout)
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
  
  def create_button(name)
    button = Qt::PushButton.new(name)
    button.object_name = name 
    button
  end

  def create_add_button
    create_button("Add")
  end

  def create_cancel_button
    cancel_button = create_button("Cancel")
    cancel_button.setDefault(true)
    cancel_button
  end

  def create_window_layout 
    self.resize(400, 400)
    layout = Qt::FormLayout.new
    layout.object_name = "Form"
    layout
  end

  def create_field(name, label, layout)
    name_label = Qt::Label.new label
    @name_text_box = Qt::LineEdit.new self
    @name_text_box.object_name = name 
    layout.addRow(name_label, @name_text_box)
  end

  def create_address(layout)
    address_label = Qt::Label.new "Address:"
    @multi_line_text_box = Qt::TextEdit.new(self)
    @multi_line_text_box.object_name = "address"
    layout.addWidget(address_label)
    layout.addWidget(@multi_line_text_box)
  end

  def click
    Contacts.create(:first_name => @name_text_box.text)
  end
end

