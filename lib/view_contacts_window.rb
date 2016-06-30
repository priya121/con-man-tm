class ViewContactsWindow < Qt::Widget

  attr_accessor :repository

  def initialize(repository)
    super(nil)
    @repository = repository
    table = Qt::TableWidget.new(self)
    table.object_name = "Table"
    table = setup(table)
    display_contacts(table)
  end

  def setup(table)
    table.setRowCount(3)
    table.setColumnCount(3)
    table
  end

  def display_contacts(table)
    contacts = @repository.get_all[0]
    label = Qt::TableWidgetItem.new(contacts.first_name)
    table.set_item(0, 0, label)
  end
end
