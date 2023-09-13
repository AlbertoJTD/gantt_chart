# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_913_042_243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'links', force: :cascade do |t|
    t.string 'link_type', limit: 1
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'project_id', null: false
    t.bigint 'source_id', null: false
    t.bigint 'target_id', null: false
    t.index ['project_id'], name: 'index_links_on_project_id'
    t.index ['source_id'], name: 'index_links_on_source_id'
    t.index ['target_id'], name: 'index_links_on_target_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description'
    t.datetime 'start_date', null: false
    t.datetime 'end_date', null: false
    t.boolean 'completed', default: false
    t.bigint 'project_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'percentage_completed', default: 0, null: false
    t.bigint 'parent_id'
    t.integer 'duration', null: false
    t.index ['parent_id'], name: 'index_tasks_on_parent_id'
    t.index ['project_id'], name: 'index_tasks_on_project_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'links', 'projects'
  add_foreign_key 'links', 'tasks', column: 'source_id'
  add_foreign_key 'links', 'tasks', column: 'target_id'
  add_foreign_key 'tasks', 'projects'
  add_foreign_key 'tasks', 'tasks', column: 'parent_id'
end
