class AddPublisherIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :publisher, foreign_key: true
  end
end
