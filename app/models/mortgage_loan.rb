class MortgageLoan < ActiveRecord::Base
  attr_accessible :FinProj, :IPDcontrol, :contracCurrency, :disAcc, :interestCal, :loanClass, :loanType, :term
  has_one :condition, :dependent =>  :destroy
  belongs_to :contract
  validates_associated :condition

  validates_presence_of :FinProj, :IPDcontrol, :contracCurrency, :disAcc, :interestCal, :loanClass, :loanType, :term, :condition_id
  validates_numericality_of :FinProj, :IPDcontrol, :contracCurrency, :disAcc, :interestCal, :loanClass, :loanType, :term
  validates_inclusion_of :loanType , :in => [1, 2, 3]#1抵押 2质押 3担保
  validates_inclusion_of :term , :in => [ 1 , 2, 3, 4]#1short 2medium 3long 4noLimit

end
