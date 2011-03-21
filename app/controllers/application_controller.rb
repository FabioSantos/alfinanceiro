class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :logado
# Checagem de usuario ==========================================================
  def logado
    if session[:usuario] == "logado"
      @usuario_logado = CoreUsuario.find(session[:usuario_atual])
      if @usuario_logado.ultimo_acesso + 2.hours > DateTime.now#1.minute > DateTime.now
        if @usuario_logado.status
          atualizar_data_hora_da_sessao; return true
        else
          flash[:erro] = "Usuário não Ativo"
          session[:usuario] = "naologado"
          redirect_to core_login_index_path
        end
      else
        flash[:erro] = "Sessão Expirada por tempo limite!"
        session[:usuario] = "naologado"
        redirect_to core_login_index_path
      end
    else
      redirect_to core_login_index_path
    end
  end

  def atualizar_data_hora_da_sessao
    if session[:usuario] == "logado"
      @usuario_logado = CoreUsuario.find(session[:usuario_atual]) unless @usuario_logado
      @usuario_logado.atualizar_data_hora_da_sessao
    end
    return true
  end

  def sou_admin; (@usuario_logado.admin ? true : area_restrita); end

  def sou_admin_return; (@usuario_logado.admin ? true : false); end

  def sou_eu(id); (@usuario_logado.id == id ? true : area_restrita); end

  def sou_eu_return(id); (@usuario_logado.id == id ? true : false); end

  def sou_su; (@usuario_logado.su ? true : area_restrita); end

  def sou_su_return; (@usuario_logado.su ? true : false); end

  def area_restrita
    flash[:erro] = "Área restrita!"
    redirect_to core_login_index_path
    return false
  end
# Fim Checagem de usuario ------------------------------------------------------
end

