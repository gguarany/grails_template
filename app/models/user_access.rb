class UserAccess < ApplicationRecord
  self.table_name = 'acesso'


  def self.create_to_user(user, permitions)
    format_acesso_basico(permitions)

    values = permitions.map{ |permition| "('#{user.id}', #{permition[:code]}, '#{permition[:permitions][:incluir]}', '#{permition[:permitions][:alterar]}', '#{permition[:permitions][:excluir]}' )" }.join(", ")

    ActiveRecord::Base.connection.execute("INSERT INTO acesso(user_id, menu_opcao, incluir, alterar, excluir) VALUES #{values}")
  end

  def self.format_acesso_basico(permitions)
    permitions.each do |permition|
      if permition[:code] == "1" || permition[:code] == "4"
        permition[:permitions][:incluir] = true
        permition[:permitions][:alterar] = true
        permition[:permitions][:excluir] = true
      end
    end
  end
end
