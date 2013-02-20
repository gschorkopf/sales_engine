require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/emoji'

$LOAD_PATH.unshift('./lib')
require './lib/sales_engine'