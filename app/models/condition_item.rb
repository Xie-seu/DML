class ConditionItem < ActiveRecord::Base
  attr_accessible :ED, :Frg, :IS, :MC, :PF, :calcDate, :conditionAmount, :condType, :condition_id, :currency, :description, :dueOn, :effFrom, :repayPercent
  belongs_to :condition
  #资料验证
  validates_presence_of :calcDate, :condType, :dueOn, :effFrom ,:condition_id, :currency
  validates_presence_of :conditionAmount , :if => "repayPercent.nil?"
end

