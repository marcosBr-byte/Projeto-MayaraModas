class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :usuario_atual, :logado?

  private

  def usuario_atual
    @usuario_atual ||= User.find_by(id: session[:user_id])
  end

  def logado?
    usuario_atual.present?
  end

  def requer_login
    unless logado?
      flash[:alert] = "Você precisa estar logado para acessar essa página."
      redirect_to "/user/login"
    end
  end

  def requer_admin
    unless usuario_atual&.admin?
      flash[:alert] = "Acesso restrito a administradores."
      redirect_to root_path
    end
  end
end
