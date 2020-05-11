class UsersAdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  before_action :set_collections, only: [:edit, :update, :new]
  before_action :set_user, only: [:edit, :update]
  before_action :format_params, only: [:update, :create]

  ACCESS_ID = MENU_ACESSO[:usuarios]

  def index
    @users = User.all
  end
  
  def edit
  end

  def update
    User.transaction do
      @user.user_accesses.destroy_all unless access_params.empty?

      UserAccess.create_to_user(@user, access_params) if access_params.present?
      true
    end

    return redirect_to users_admin_index_path, notice: 'Usuário atualizado com sucesso!' if @user.update(user_params)

    render :edit, collection: set_collections
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params.merge({ password: '123456' })
    
    if @user.save
      UserAccess.create_to_user(@user, access_params) if access_params.present?

      return redirect_to users_admin_index_path, notice: 'Usuário registrado com sucesso!' 
    end

    render :new, collection: set_collections
  end

  private

  def set_collections
    @accesses = MenuFilter.accesses(MENU_NAV)
  end
  
  def set_user
    @user = User.find params[:id]
  end
  
  def format_params
    params[:user][:admin] = params[:user][:admin] == 'true' ? true : false  
  end

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :admin
    )
  end

  def access_params
    accesses = params[:access]
    hash_data = []

    return hash_data if accesses.nil?

    accesses.each do |_key, permition|
      hash_data.push(
        code: permition[:id],
        permitions: {
          incluir: permition[:incluir] || 'F',
          alterar: permition[:alterar] || 'F',
          excluir: permition[:excluir] || 'F'
        }
      )
    end

    hash_data
  end
end
