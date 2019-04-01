require 'rails_helper'

RSpec.describe "a user edits an article" do
  describe "they link from the show page" do
    it "they fill in an edit field and submit displays the updated information on a show page" do
      article_1 = Article.create(title: "Article 1", body: "Lots of words.")

      visit article_path(article_1)

      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: "Article 1"
      fill_in "article[body]", with: "I've been edited!"
      click_button "Update Article"

      expect(page).to have_content("Article 1")
      expect(page).to have_content("I've been edited!")
      expect(page).to have_content("Article '#{article_1.title}' Updated!")
    end
  end
end
