# frozen_string_literal: true

class TemplateMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :template_migration, force: :cascade do |t|
      # content

      t.timestamps null: false
    end
  end
end
