class CreateDownloadStats < ActiveRecord::Migration[7.0]
  def change
    create_table :download_stats do |t|
      t.string :package
      t.string :version
      t.integer :downloads

      t.timestamps
    end
  end
end
