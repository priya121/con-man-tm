class ViewContactsWindow < Qt::Widget

  attr_accessor :repository

  def initialize(repository)
    super(nil)
    @repository = repository
    grid = Qt::GridLayout.new
    grid.object_name = "Grid"
    self.setLayout(grid)
  end
end
