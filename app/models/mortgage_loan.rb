class MortgageLoan < ActiveRecord::Base
  attr_accessible :FinProj, :IPDcontrol, :contracCurrency, :disAcc, :interestCal, :loanClass, :loanType, :term

  belongs_to :contract

  validates_presence_of :FinProj, :IPDcontrol,  :disAcc, :interestCal, :loanType
  validates_numericality_of :FinProj, :IPDcontrol, :disAcc, :interestCal, :loanClass, :loanType
  validates_inclusion_of :loanType , :in => [1, 2, 3]#1抵押 2质押 3担保
  validates_inclusion_of :term , :in => [ 1 , 2, 3, 4]#1short 2medium 3long 4noLimit
  validates_inclusion_of :interestCal, :in => [1,2,3]

end
