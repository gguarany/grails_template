# frozen_string_literal: true

ActiveSupport::Notifications.subscribe 'routes_loaded.application' do
  path = Rails.application.routes.url_helpers

  CADASTRO_BLOCK_ONE = [
    {
      header: 'Parâmetros do Sistema',
      items: [
        {
          id: MENU_ACESSO[:usuarios],
          description: 'Usuários',
          action: path.users_admin_index_path,
          visible_menu: true
        }
      ]
    }
  ].freeze

  MENU_NAV = [
    {
      id: 'cadastro',
      description: 'Cadastros',
      icon: 'archive',
      sessions: [CADASTRO_BLOCK_ONE]
    }
  ].freeze
end
