class Message
  BASE_URL = "https://stage.skipio.com/api/v2/messages?token=#{ENV['SKIPIO_TOKEN']}"
  attr_accessor :contact_id, :body

  def initialize(contact_id:, body: nil)
    @contact_id = contact_id
    @body = body
  end

  def self.create(contact_id:, body:)
    params = {
      recipients: ["contact-#{contact_id}"],
      message: { body: body }
    }
    attempt_count = 0
    begin
      attempt_count += 1
      RestClient.post(BASE_URL, params)
      return true
    rescue
      attempt_count < 5 ? retry : (return false)
    end
  end
end