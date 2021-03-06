require 'rails_helper'
require_relative '../support/validation_helper'

describe 'Homepage' do
  it 'has expected content' do
    # WP-client gem must have hard coded reference to STDOUT or STDERR:
    # swapping $stdout and $stderr didn't quiet it.
    visit '/'

    expect(page.status_code).to eq(200)
    expect(page).to have_text('Discover historic programs')
    expect_fuzzy_xml(allow_default_title: true)
  end
end
