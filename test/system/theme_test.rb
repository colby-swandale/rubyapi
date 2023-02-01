require "application_system_test_case"

class ThemeTest < ApplicationSystemTestCase
  def setup
    @string = FactoryBot.build(:ruby_object)
    create_index_for_version! default_ruby_version
    index_object @string
  end

  test "setting dark mode" do
    visit root_path

    click_button "Select Theme"

    click_button "Dark Theme"

    htmlElement = page.find("html")
    assert htmlElement[:class].include?("dark")
  end

  test "setting dark mode and changing page" do
    visit root_path

    click_button "Select Theme"

    click_button "Dark Theme"

    visit object_url object: @string.path

    htmlElement = page.find("html")
    assert htmlElement[:class].include?("dark")
  end

  test "setting dark mode and then light mode" do
    visit root_path

    click_button "Select Theme"

    click_button "Dark Theme"

    assert_selector "html.dark"

    click_button "Select Theme"

    click_button "Light Theme"

    assert_selector "html.light"
  end
end
