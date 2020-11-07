require 'spec_helper'

RSpec.describe 'トップページ', type: :feature do
  describe 'トップページ' do
    it '挨拶文を表示' do
      visit root_path
      expect(page).to have_content('このページは仮のトップページです!')
    end
  end
end
