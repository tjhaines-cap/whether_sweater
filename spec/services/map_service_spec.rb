require 'rails_helper' 

RSpec.describe MapService do

  describe 'class methods' do
    describe '#get_latitude_longitude' do
      it "gets the latitude and long", :vcr do
        response = MapService.get_latitude_longitude("Manitou Springs, CO")
      
        data = response[:info][:results][0]
        expect(data).to be_a(Hash)
        lat_long = data[:displayLatLng]
        expect(lat_long).to have_key(:lat)
        expect(lat_long).to have_key(:lng)
        expect(lat_long[:lat]).to be_a(Float)
        expect(lat_long[:lng]).to be_a(Float)
      end
    end
  end
end