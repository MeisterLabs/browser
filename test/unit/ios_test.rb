require "test_helper"

class IosTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects iphone" do
    @browser.ua = $ua["IPHONE"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.platform.ios?
    refute @browser.platform.mac?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects safari" do
    @browser.ua = $ua["SAFARI"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.1", @browser.full_version
    assert_equal "5", @browser.version
  end

  test "detects safari in webapp mode" do
    @browser.ua = $ua["SAFARI_IPAD_WEBAPP_MODE"]
    refute @browser.safari?
    assert @browser.platform.ios_webview?

    @browser.ua = $ua["SAFARI_IPHONE_WEBAPP_MODE"]
    refute @browser.safari?
    assert @browser.platform.ios_webview?
  end

  test "detects ipod" do
    @browser.ua = $ua["IPOD"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.platform.ios?
    refute @browser.device.tablet?
    refute @browser.platform.mac?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects ipad" do
    @browser.ua = $ua["IPAD"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.platform.ios?
    refute @browser.platform.mac?
    assert_equal "4.0.4", @browser.full_version
    assert_equal "4", @browser.version
  end

  test "detects ios4" do
    @browser.ua = $ua["IOS4"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(4)
    refute @browser.platform.mac?
  end


  test "detects ios5" do
    @browser.ua = $ua["IOS5"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(5)
    refute @browser.platform.mac?
  end

  test "detects ios6" do
    @browser.ua = $ua["IOS6"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(6)
    refute @browser.platform.mac?
  end

  test "detects ios7" do
    @browser.ua = $ua["IOS7"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(7)
    refute @browser.platform.mac?
  end

  test "detects ios8" do
    @browser.ua = $ua["IOS8"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(8)
    refute @browser.platform.mac?
  end

  test "detects ios9" do
    @browser.ua = $ua["IOS9"]
    assert @browser.platform.ios?
    assert @browser.platform.ios?(9)
    refute @browser.platform.mac?
  end

  test "don't detect as two different versions" do
    @browser.ua = $ua["IOS8"]
    assert @browser.platform.ios?(8)
    refute @browser.platform.ios?(7)
  end

  test "returns string representation for iphone" do
    @browser.ua = $ua["IPHONE"]
    meta = @browser.to_s

    assert meta.include?("webkit")
    assert meta.include?("ios")
    assert meta.include?("safari")
    assert meta.include?("safari3")
    assert meta.include?("modern")
    assert meta.include?("mobile")
  end

  test "returns string representation for ipad" do
    @browser.ua = $ua["IPAD"]
    meta = @browser.to_s

    assert meta.include?("webkit")
    assert meta.include?("ios")
    assert meta.include?("safari")
    assert meta.include?("modern")
    assert meta.include?("tablet")
    refute meta.include?("mobile")
  end
end