class BusinessProcessRecord < ActiveRecord::Base
  attr_accessible :keyWord, :operationType, :processor, :serialNum
  validates_presence_of :keyWord, :operationType, :processor, :serialNum
  validates_numericality_of :keyWord, :operationType, :serialNum
end
