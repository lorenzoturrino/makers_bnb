describe Space do
  let(:host) { User.create(name: 'Anne', username: 'Anne', email: 'anne@me.com', password: 1234, password_confirmation: 1234) }

  it 'should have a start and end date for availability' do
    Space.create(name: 'Space1', description: 'Test description', price: '100.50', start_availability: '2016-05-01', end_availability: '2016-05-20', user: host)
    expect(Space.first.start_availability).not_to be(nil)
    expect(Space.first.end_availability).not_to be(nil)
  end



end
