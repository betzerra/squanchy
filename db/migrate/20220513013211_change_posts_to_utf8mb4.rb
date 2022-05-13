class ChangePostsToUtf8mb4 < ActiveRecord::Migration[7.0]
  def change
    def up
      execute "ALTER TABLE posts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
      execute "ALTER TABLE posts MODIFY content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    end
    def down
      execute "ALTER TABLE posts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
      execute "ALTER TABLE posts MODIFY content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    end
  end
end
