#! usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'con_man'
require 'qt'

app = Qt::Application.new (ARGV)
window = ConMan.new
window.show
app.exec
