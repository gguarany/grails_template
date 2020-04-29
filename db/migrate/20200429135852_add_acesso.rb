class AddAcesso < ActiveRecord::Migration[6.0]
  def change
    create_table "acesso", force: :cascade do |t|
      t.integer "user_id", limit: 10, null: false
      t.integer "menu_opcao", null: false
      t.boolean "incluir", default: false
      t.boolean "excluir", default: false
      t.boolean "alterar", default: false
    end
  end
end
