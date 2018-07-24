require('minitest/autorun')
require_relative('../models/owner')

class TestOwner < MiniTest::Test

  def setup
    @owner1 = Owner.new({'first_name' => 'Joanna', 'last_name' => 'Gora', 'username' => 'joagora'})
    @owner1.save
    @owner2 = Owner.new({'first_name' => 'Mike', 'last_name' => 'Smith', 'username' => 'smithy'})
    @owner2.save
    @owner3 = Owner.new({'first_name' => 'Beata', 'last_name' => 'Ficek', 'username' => 'ficky'})
    @owner3.save
    @owner4 = Owner.new({'first_name' => 'Joanna', 'last_name' => 'Gora', 'username' => 'j.gora'})
    @owner4.save
  end


  def test_username_exists
    expected = true
    actual = Owner.check_if_exists?("joagora")
    assert_equal(expected, actual)
  end

  def test_username_exists__false
    expected = false
    actual = Owner.check_if_exists?("joahaha")
    assert_equal(expected, actual)
  end
end
