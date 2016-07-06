class ViewContactsWindow < Qt::Widget

  attr_accessor :repository

  def initialize(repository)
    super(nil)
    @repository = repository
    table = setup_display
    setup(table)
    set_name_header(table)
    set_telephone_header(table)
    display_contacts(table)
  end

  def setup_display
    layout = Qt::VBoxLayout.new(self)
    table = Qt::TableWidget.new
    layout.addWidget(table)
    table.object_name = "Table"
    table
  end

  def display_contacts(table)
    table.horizontalHeader.setResizeMode(Qt::HeaderView::Stretch)
    if @repository.get_all.size > 0
      display_all_contacts(table)
    end
  end

  private

  def display_all_contacts(table)
    contacts = @repository.get_all
    contacts.each_with_index do |contact, index|
      label = Qt::TableWidgetItem.new(contact.name)
      table.set_item(index, 0, label)
    end
  end

  def setup(table)
    table.setRowCount(20)
    table.setColumnCount(3)
    table
  end

  def set_name_header(table)
    contacts_header = Qt::TableWidgetItem.new("Contact")
    contacts_header.text = "Contact"
    table.setHorizontalHeaderItem(0, contacts_header)
  end

  def set_telephone_header(table)
    telephone_header = Qt::TableWidgetItem.new("Telephone Number")
    telephone_header.text = "Telephone"
    table.setHorizontalHeaderItem(1, telephone_header)
  end
end
