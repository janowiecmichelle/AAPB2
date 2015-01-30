require 'rails_helper'

describe 'Organizations' do

  describe '#index' do
    it 'works' do
      visit '/organizations'
      expect(page.status_code).to eq(200)
      expect(page).to have_text('TODO: organizations list')
      expect(page).to have_text('WGBH')
    end
  end
  
  describe '#show' do
    it 'works' do
      visit '/organizations/1784.2'
      expect(page.status_code).to eq(200)
      expect(page).to have_text('WGBH')
      expect(page).to have_text('Boston, Massachusetts')
      # TODO: when WGBH has more content, make sure it shows up.
      
      expect(page).not_to have_text('WGBY') 
      # Has ID "1784": We want to be sure Rails is not ignoring the ".2".
    end
  end

end