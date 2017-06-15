describe Bookeddate do
  it 'Creates a new entry' do
    Bookeddate.create(date: '01/01/2018')
    expect(Bookeddate.first.format_date).to eq '01/01/2018'
  end
end
