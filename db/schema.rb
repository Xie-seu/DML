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

ActiveRecord::Schema.define(:version => 20140419091359) do

  create_table "applies", :force => true do |t|
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
    t.integer  "status"
    t.float    "amount"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.date     "calcuDate"
    t.string   "flowName"
    t.float    "cashAmount"
    t.integer  "PC"
    t.float    "basisAmount"
    t.decimal  "centage"
    t.date     "caluFrom"
    t.date     "caluUntil"
    t.integer  "dayNum",      :default => 30
    t.date     "dueDate"
    t.integer  "contract_id"
    t.string   "PCname"
    t.boolean  "creditSide"
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

  create_table "cond_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "condition_items", :force => true do |t|
    t.integer  "condType"
    t.date     "effFrom"
    t.decimal  "repayPercent",    :precision => 5, :scale => 5
    t.float    "conditionAmount"
    t.integer  "currency",                                      :default => 1
    t.integer  "IS"
    t.integer  "PF"
    t.integer  "Frg"
    t.integer  "dueOn"
    t.integer  "ED"
    t.date     "calcDate"
    t.integer  "MC"
    t.string   "description"
    t.integer  "contract_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "conditions", :force => true do |t|
    t.integer  "commitCapital"
    t.integer  "repaymentType",                                  :default => 1
    t.decimal  "disbursementRate", :precision => 5, :scale => 4
    t.integer  "discountType",                                   :default => 1
    t.date     "fixedFrom"
    t.date     "fixedUntil"
    t.date     "termStart"
    t.date     "termEnd"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "contract_id"
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
    t.integer  "currency",                                     :default => 1
    t.integer  "browser"
    t.date     "startDate"
    t.date     "endDate"
    t.time     "contractPeriod"
    t.integer  "repaymentType",                                :default => 1
    t.decimal  "interest",                                     :default => 5.5
    t.decimal  "defaulInt",      :precision => 5, :scale => 4, :default => 5.5
    t.string   "credit"
    t.integer  "status"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.float    "repay_amount"
    t.float    "open_item"
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
    t.integer  "contract_id"
  end

  create_table "flow_types", :force => true do |t|
    t.integer  "flowNum"
    t.string   "flowName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.integer  "loanType",        :default => 1
    t.integer  "loanClass",       :default => 0
    t.integer  "IPDcontrol",      :default => 1
    t.integer  "disAcc",          :default => 1
    t.integer  "FinProj",         :default => 0
    t.integer  "interestCal"
    t.integer  "contracCurrency"
    t.integer  "term"
    t.integer  "condition_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "contract_id"
  end

  create_table "pcs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "repayment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repayments", :force => true do |t|
    t.float    "cash_amount",  :default => 0.0
    t.date     "execute_time"
    t.string   "comment"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "contract_id"
  end

end
