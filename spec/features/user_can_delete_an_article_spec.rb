require 'rails_helper'

RSpec.describe "a user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles execpt the deleted entry" do
      article_1 = Article.create(title: "Article 1", body: "Lots of words.")
      article_2 = Article.create(title: "Article 2", body: "Lots of messed up words.")

      visit article_path(article_1)

      click_link "Delete"
save_and_open_page
      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
