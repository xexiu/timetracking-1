class AddSlug < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string
  end
end
