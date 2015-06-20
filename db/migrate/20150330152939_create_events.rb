class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :report_number
      t.string  :event_type
      t.string  :reporter_occupation
      t.string  :manufacturer_state
      t.date    :date_of_event
      t.text    :mdr_text
      t.string  :manufacturer_name
      t.string  :report_source_code
      t.integer :number_devices_in_event
      t.string  :device_operator
      t.string  :brand_name
      t.string  :generic_name
      t.string  :catalog_number
      t.string  :device_report_product_code
      t.boolean :baseline_510_k__exempt_flag

      t.timestamps null: false
    end
  end
end
