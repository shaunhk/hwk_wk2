require('minitest/rg')
require('minitest/autorun')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("George", 51.30)
  end

  def test_name
    assert_equal("George", @guest_1.name)
  end

  def test_money
    assert_equal(51.30, @guest_1.money)
  end

end
