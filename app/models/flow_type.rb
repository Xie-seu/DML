class FlowType < ActiveRecord::Base
  attr_accessible :flowName, :flowNum
  validates_presence_of :flowName
end
