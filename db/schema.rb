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

ActiveRecord::Schema.define(:version => 20140311042224) do

  create_table "business_partners", :force => true do |t|
    t.string   "name"
    t.integer  "companyCode"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "indentify_infos", :force => true do |t|
    t.string   "indentify"
    t.integer  "legelForm"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "business_partner_id"
  end

  add_index "indentify_infos", ["business_partner_id"], :name => "index_indentify_infos_on_BusinessPartner_id"
  add_index "indentify_infos", ["business_partner_id"], :name => "index_indentify_infos_on_business_partner_id"

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
