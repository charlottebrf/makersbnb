describe Booking do

  it 'Adds a booking to the database' do
    Booking.create(user_id: 1, space_id: 1)
    expect(Booking.all.length).to eq 1
  end
end
