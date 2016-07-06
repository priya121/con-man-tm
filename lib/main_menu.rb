require 'Qt'
require 'add_contact_window'
require 'view_contacts_window'

class MainMenu < Qt::Widget
  attr_reader :add_window
  attr_reader :view_window
  slots :click_add, :click_read

  HEIGHT = 800
  WIDTH = 800

  def initialize(contacts_repository)
    super(nil)
    @contacts_repository= contacts_repository
    layout = set_layout
    setLayout(layout)
    setup_window
    create_button
    read_button
  end

  def setup_window
    self.setWindowTitle("ConMan")
    self.resize(HEIGHT, WIDTH)
    self.setStyleSheet("padding: 50px")
  end

  def set_layout
    layout = Qt::HBoxLayout.new
    layout.object_name = "HorizontalLayout"
    layout
  end

  def create_button
    button = Qt::PushButton.new 
    button.object_name = "Create"
    button.text = "Create"
    connect(button, SIGNAL(:clicked), self, SLOT(:click_add))
    layout.addWidget(button)
  end

  def read_button
    button = Qt::PushButton.new 
    button.object_name = "Read"
    button.text = "Read"
    connect(button, SIGNAL(:clicked), self, SLOT(:click_read))
    layout.addWidget(button)
  end

  def click_add
    add_window = AddContactWindow.new(@contacts_repository)
    add_window.show
  end

  def click_read
    view_window = ViewContactsWindow.new(@contacts_repository)
   view_window.show
  end
end
