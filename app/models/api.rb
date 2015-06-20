class Api < ActiveRecord::Base

  require 'open-uri'

  def self.call

    skip = Event.count

    10.times do
      key = "yjWbARzzZH53v93gug5pYApZWlfLMsEB344adFo6"
      #base_url = "https://api.fda.gov/device/event.json?api_key=#{key}&limit=100&skip="
      base_url = "https://api.fda.gov/device/event.json?api_key=#{key}&limit=100&skip="
      full_url = base_url + skip.to_s 
      json = JSON.load(open(full_url))
      results = json["results"]
      skip += 100

    # PARSE JSON INTO ATTRIBUTES
      results.each do |result|
        report_number = result["report_number"]
        event_type = result["event_type"]
        reporter_occupation = result["reporter_occupation_code"]
        manufacturer_state = result["manufacturer_state"]
        date_of_event = result["date_of_event"] ? result["date_of_event"].to_date : ""
        mdr_text = result["mdr_text"] != [] ? result["mdr_text"][0]["text"] : ""
        manufacturer_name = result["manufacturer_name"]
        report_source_code = result["report_source_code"]
        number_devices_in_event = result["number_devices_in_event"]
        if result["device"] != []
          device_operator = result["device"][0]["device_operator"]
          brand_name = result["device"][0]["brand_name"]
          generic_name = result["device"][0]["generic_name"]
          catalog_number = result["device"][0]["catalog_number"]
          device_report_product_code = result["device"][0]["device_report_product_code"]
          baseline_510_k__exempt_flag = result["device"][0]["baseline_510_k__exempt_flag"]
        else
          device_operator = ""
          brand_name = ""
          generic_name = ""
          catalog_number = ""
          device_report_product_code = ""
          baseline_510_k__exempt_flag = ""
        end

      # CREATE EVENT AND ADD TO DB
      Event.create(
        report_number: report_number,
        event_type: event_type,
        reporter_occupation: reporter_occupation,
        manufacturer_state: manufacturer_state,
        date_of_event: date_of_event,
        mdr_text: mdr_text,
        manufacturer_name: manufacturer_name,
        report_source_code: report_source_code,
        number_devices_in_event: number_devices_in_event,
        device_operator: device_operator,
        brand_name: brand_name,
        generic_name: generic_name,
        catalog_number: catalog_number,
        device_report_product_code: device_report_product_code,
        baseline_510_k__exempt_flag: baseline_510_k__exempt_flag
        )
      end
    end
  end
end
