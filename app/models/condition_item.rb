class ConditionItem < ActiveRecord::Base
  attr_accessible :calcDate,
                  :conditionAmount,
                  :condType,
                  :condition_id,
                  :currency,
                  :description,
                  :dueOn,
                  :effFrom,
                  :repayPercent
  belongs_to :contract
  #资料验证
  validates_presence_of :calcDate,
                        :condType,
                        :effFrom,
                        :currency
  validates_presence_of :conditionAmount , :if => "repayPercent.nil?"
end

