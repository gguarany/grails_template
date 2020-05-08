
def grant_all_acesses(user)
  permition_codes = MENU_ACESSO.map { |_k, v| v }

  permitions = []

  permition_codes.each do |code|
    permitions << { code: code, permitions: { incluir: true, alterar: true, excluir: true } }
  end

  UserAccess.create_to_user(user, permitions)
end

user = User.new(
  name: 'Root',
  email: 'root@user.com',
  password: '123456',
  admin: true
)

if user.save
  grant_all_acesses(user)
end
