require 'pry'
require './calfresh'
require './faxer'

writer = Calfresh::ApplicationWriter.new

signature_blob = "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"
input_hash = { name_first: 'Rhino', name_middle_initial: 'T.', name_last: 'Rhinocerous', home_address: '123 Fake St', home_city_state: 'San Francisco, CA', home_zip_code: '94103', home_phone_number: '4155555555', email: 'medicalfresh@example.com' }
input_hash[:signature] = signature_blob

app = writer.fill_out_form(input_hash)

if app.has_pngs?
  puts "faxing mock"
  # Faxer.send_fax(ENV['FAX_DESTINATION_NUMBER'], app.png_file_set)
end

binding.pry
