require 'qt'
require 'contacts'

class ConMan < Qt::Widget 
  slots :click, :pressed, :valid_email?

  def initialize
    super(nil)
    self.setWindowTitle("Add Contacts")
    layout = create_window_layout
    create_fields(layout)
    create_buttons(layout)
    setLayout(layout)
  end

  def create_fields(layout)
    create_field("first_name", "First Name:", layout, @first_name)
    create_field("last_name", "Last Name:", layout, @last_name)
    create_field("dob", "DOB:", layout, @dob)
    create_field("telephone", "Telephone:", layout, @tel)
    create_field("email", "Email:", layout, @email)
    create_address(layout)
    set_email_validator
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

  def create_field(name, label, layout, id)
    name_label = Qt::Label.new label
    id = Qt::LineEdit.new self
    id.object_name = name 
    layout.addRow(name_label, id)
  end

  def create_address(layout)
    address_label = Qt::Label.new "Address:"
    @multi_line_text_box = Qt::TextEdit.new(self)
    @multi_line_text_box.object_name = "address"
    layout.addWidget(address_label)
    layout.addWidget(@multi_line_text_box)
  end

  def set_email_validator
    @sign = Qt::RegExp.new("[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}")
    validator = Qt::RegExpValidator.new(@sign, self)
    @email = find_widget("email")
    @email.setValidator(validator)
    connect(@email, SIGNAL(:returnPressed), self, SLOT(:valid_email?))
  end

  def valid_email?
     @sign.exactMatch(@email.text)
  end

  def click
    Contacts.create(:first_name => find_widget("first_name").text)
  end

  private
    def find_widget(name)
      self.children.find { |child| child.object_name == name }
    end
end

