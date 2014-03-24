# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140316033620) do

  create_table "applies", :force => true do |t|
    t.integer  "proposer"
    t.integer  "loanType"
    t.integer  "term"
    t.string   "usePath"
    t.float    "amount"
    t.integer  "currency"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "repaymentType"
    t.string   "processor"
    t.integer  "business_partner_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "business_partners", :force => true do |t|
    t.string   "name"
    t.integer  "companyCode"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "apply_id"
  end

  create_table "business_process_records", :force => true do |t|
    t.integer  "serialNum"
    t.integer  "operationType"
    t.string   "processor"
    t.string   "keyWord"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cash_flows", :force => true do |t|
    t.integer  "flowType"
    t.integer  "currency"
    t.float    "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collaterals", :force => true do |t|
    t.integer  "collateralType"
    t.integer  "feather"
    t.float    "objectValue"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "business_partner_id"
  end

  add_index "collaterals", ["business_partner_id"], :name => "index_collaterals_on_BusinessPartner_id"
  add_index "collaterals", ["business_partner_id"], :name => "index_collaterals_on_business_partner_id"

  create_table "communication_infos", :force => true do |t|
    t.string   "address"
    t.string   "mobile"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "business_partner_id"
  end

  add_index "communication_infos", ["business_partner_id"], :name => "index_communication_infos_on_BusinessPartner_id"
  add_index "communication_infos", ["business_partner_id"], :name => "index_communication_infos_on_business_partner_id"

  create_table "condition_items", :force => true do |t|
    t.integer  "condType"
    t.date     "effFrom"
    t.decimal  "repayPercent"
    t.float    "conditionAmount"
    t.integer  "currency"
    t.integer  "IS"
    t.integer  "PF"
    t.integer  "Frg"
    t.integer  "dueOn"
    t.integer  "ED"
    t.date     "calcDate"
    t.integer  "MC"
    t.string   "description"
    t.integer  "condition_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "conditions", :force => true do |t|
    t.integer  "commitCapital"
    t.integer  "repaymentType"
    t.decimal  "disbursementRate"
    t.integer  "discountType"
    t.date     "fixedFrom"
    t.date     "fixedUntil"
    t.date     "termStart"
    t.date     "termEnd"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "contract_business_partnerships", :force => true do |t|
    t.integer  "contract_id"
    t.integer  "business_partner_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "contracts", :force => true do |t|
    t.integer  "serialID"
    t.integer  "contractNumber"
    t.integer  "term"
    t.string   "usePath"
    t.float    "amount"
    t.integer  "currency"
    t.integer  "browser"
    t.date     "startDate"
    t.date     "endDate"
    t.time     "contractPeriod"
    t.integer  "repaymentType"
    t.float    "interest"
    t.float    "defaulInt"
    t.string   "credit"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "disbursements", :force => true do |t|
    t.integer  "flowType"
    t.text     "text"
    t.integer  "repaymentType"
    t.integer  "postingControl"
    t.date     "paymentDate"
    t.float    "currentPayment"
    t.integer  "nominalPayment"
    t.decimal  "disbursementRate"
    t.float    "disbursementInt"
    t.float    "grossPayAmount"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "indentify_infos", :force => true do |t|
    t.string   "indentify"
    t.integer  "legelForm"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "business_partner_id"
  end

  add_index "indentify_infos", ["business_partner_id"], :name => "index_indentify_infos_on_BusinessPartner_id"
  add_index "indentify_infos", ["business_partner_id"], :name => "index_indentify_infos_on_business_partner_id"

  create_table "mortgage_loans", :force => true do |t|
    t.integer  "loanType"
    t.integer  "loanClass"
    t.integer  "IPDcontrol"
    t.integer  "disAcc"
    t.integer  "FinProj"
    t.integer  "interestCal"
    t.integer  "contracCurrency"
    t.integer  "term"
    t.integer  "condition_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "contract_id"
  end

  create_table "repayment_infos", :force => true do |t|
    t.integer  "bankID"
    t.integer  "bankAcct"
    t.boolean  "collection"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "business_partner_id"
  end

  add_index "repayment_infos", ["business_partner_id"], :name => "index_repayment_infos_on_BusinessPartner_id"
  add_index "repayment_infos", ["business_partner_id"], :name => "index_repayment_infos_on_business_partner_id"

end
