require 'rails_helper'

describe 'user sees one article' do
  describe 'they click from the articles index' do
    it 'display information from one article' do
      article = Article.create!(title: "New Article", body: "New body.")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
