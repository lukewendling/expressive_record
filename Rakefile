require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('expressive_record', '0.2.0') do |p|
  p.description    = "Add meaningful names for belongs_to associations to Rails 2.1 model object dirty changes to help with rolling your own history/audit logger."
  p.url			       = "http://github.com/lukewendling/expressive_record"
  p.author          = "Luke Wendling"
  p.email           = "luke@lukewendling.com"
  p.development_dependencies  = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

