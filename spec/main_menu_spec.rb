require 'main_menu'

describe MainMenu do
  let (:repository) {InMemoryContactsRepository.new}
  let(:window) {MainMenu.new(repository)}

  before(:all) do 
    Qt::Application.new(ARGV)
  end

  def find_widget(name)
    window.children.find { |child| child.object_name == name }
  end

  it 'is a window' do
    expect(window).to be_kind_of(Qt::Widget)
    expect(window.parent).to be_nil
  end

  it 'has a title' do
    expect(window.windowTitle).to eq "ConMan"
  end

  it 'has a grid layout' do
    expect(window.find_child(Qt::HBoxLayout, "HorizontalLayout")).to be_kind_of(Qt::HBoxLayout)
  end

  it 'has a default size' do
      expect(window.height).to eq(800)
      expect(window.width).to eq(800)
  end

  it 'has a create option' do
    expect(window.find_child(Qt::PushButton, "Create")).to be_kind_of(Qt::PushButton)
  end

  it 'has a read option' do
    expect(window.find_child(Qt::PushButton, "Read")).to be_kind_of(Qt::PushButton)
  end

  it 'can click Create and open a new Add Contact window' do
    expect(window.find_child(Qt::PushButton, "Create").click).to eq(window.add_window) 
  end

  it 'can click Read and open a new Read Contact window' do
    expect(window.find_child(Qt::PushButton, "Read").click).to eq(window.view_window) 
  end
end

