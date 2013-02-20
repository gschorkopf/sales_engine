require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

Rake::TestTask.new "merchant:test" do |t|
  t.pattern = "test/merchant_test.rb"
end