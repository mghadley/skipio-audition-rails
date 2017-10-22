class Contact
  BASE_URL = "https://stage.skipio.com/api/v2/contacts?token=#{ENV['SKIPIO_TOKEN']}"

  def self.all
    total_pages = nil
    contacts = []
    loop.with_index do |_, i|
      page = i + 1
      url = BASE_URL + "&page=#{page}&per=100"
      attempt_count = 0
      begin
        attempt_count += 1
        response = RestClient.get(BASE_URL).body
        response_hash = JSON.parse(response).with_indifferent_access
        total_pages ||= response_hash[:meta][:total_pages]
        contacts += response_hash[:data]
        break if page == total_pages
      rescue
        attempt_count < 5 ? retry : (return [])
      end
    end
    return contacts
  end
end