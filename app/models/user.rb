# frozen_string_literal: true

class User < ApplicationRecord
  include UserMenu
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_accesses

  accepts_nested_attributes_for :user_accesses, allow_destroy: true

  def permitions
    accesses = user_accesses || {}
    @_permitions ||= accesses
  end

  def total_access
    permitions.pluck(:menu_opcao).uniq
  end

  def can_create?(access_code)
    return true if admin?

    return permitions.find_by(menu_opcao: access_code).incluir

    false
  end

  def can_edit?(access_code)
    return true if admin?

    return permitions.find_by(menu_opcao: access_code).alterar

    false
  end

  def can_destroy?(access_code)
    return true if admin?

    return permitions.find_by(menu_opcao: access_code).excluir

    false
  end
end
