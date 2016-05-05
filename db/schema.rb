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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160505093422) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "messaggio"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photographers", force: :cascade do |t|
    t.string   "nome"
    t.string   "titolo"
    t.text     "descrizione"
    t.string   "indirizzo"
    t.text     "imprevisti"
    t.integer  "foto_cerimonia"
    t.integer  "video_cerimonia"
    t.integer  "foto_pre"
    t.integer  "video_pre"
    t.integer  "foto_post"
    t.integer  "video_post"
    t.integer  "second_camera"
    t.integer  "second_videocamera"
    t.integer  "album"
    t.integer  "mini_album"
    t.integer  "foto_hd"
    t.integer  "negativi"
    t.integer  "dvd"
    t.integer  "trailer_foto"
    t.integer  "trailer_video"
    t.integer  "drone"
    t.string   "tempi_consegna"
    t.string   "num_foto"
    t.string   "durata_video"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "cancellazione"
  end

  add_index "photographers", ["user_id"], name: "index_photographers_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "photographer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["photographer_id"], name: "index_photos_on_photographer_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photographer_id"
    t.datetime "data"
    t.string   "indirizzo"
    t.string   "status"
    t.integer  "total"
    t.string   "tempi_consegna"
    t.string   "num_foto"
    t.string   "durata_video"
    t.text     "imprevisti"
    t.text     "cancellazione"
    t.integer  "foto_cerimonia"
    t.integer  "video_cerimonia"
    t.integer  "foto_pre"
    t.integer  "foto_post"
    t.integer  "video_pre"
    t.integer  "video_post"
    t.integer  "second_camera"
    t.integer  "second_videocamera"
    t.integer  "album"
    t.integer  "mini_album"
    t.integer  "foto_hd"
    t.integer  "negativi"
    t.integer  "dvd"
    t.integer  "trailer_foto"
    t.integer  "trailer_video"
    t.integer  "drone"
    t.text     "messaggio"
    t.integer  "num_album"
    t.integer  "num_mini_album"
    t.integer  "num_dvd"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "reservations", ["photographer_id"], name: "index_reservations_on_photographer_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "telefono"
    t.text     "descrizione"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
