class Plant < ApplicationRecord
  belongs_to :family
  belongs_to :genus
  has_one :status

  def status
    Status.find(status_id)
  end

  # @return [Hash]
  def trefle_data
    Rails.cache.fetch("#{name}-trefle", expires_in: 15.minutes) do
      response = Plants.search_for_plant(name)
      if response.status.success?
        response.parse['data'].first
      else
        {}
      end
    end
  end
end
