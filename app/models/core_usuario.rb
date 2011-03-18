class CoreUsuario < ActiveRecord::Base
  apply_simple_captcha
# Callbacks ====================================================================
  before_create :encripitar_senha
# Fim Callbacks ----------------------------------------------------------------
# Atributos ====================================================================
  attr_accessor :senha_confirmation
# Fim Atributos ----------------------------------------------------------------
# scopos =======================================================================
  named_scope :busca, lambda {|filtro| {:conditions=>["cpf ilike and matricula ilike ?", "%#{filtro}%", "%#{filtro}%"]}}
  named_scope :ativo, :conditions=>{:status=>true}
  named_scope :inativo, :conditions=>{:status=>false}
  named_scope :admin, :conditions=>{:admin=>true}
  named_scope :su, :conditions=>{:su=>true}
# Fim scopos -------------------------------------------------------------------
# Validações ===================================================================
  validates_presence_of :nome
  validates_presence_of :matricula
  validates_presence_of :cpf
  usar_como_cpf :cpf
  validates_uniqueness_of :cpf
  validates_presence_of :senha
  validates_confirmation_of :senha
# Fim Validações ---------------------------------------------------------------
# Métodos  =====================================================================
  def encripitar_senha; self.senha = Digest::SHA1.hexdigest("#{self.senha}"); end

  def self.login(l, senha); CoreUsuario.find(:first, :conditions=>["email = ? and senha = ?", l, Digest::SHA1.hexdigest("#{senha}")]); end

  def mudar_status; (self.status ? (self.status = false) : (self.status = true)); self.save; end

  def atualizar_data_hora_da_sessao; self.ultimo_acesso = DateTime.now; self.save; end

  def random_alphanumeric(size=8)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ['!','@','#','$','%','&','*']
    (0...size).collect { chars[Kernel.rand(chars.length)] }.join
  end

  def criar_nova_senha
    self.senha = Digest::SHA1.hexdigest("#{nova_senha = random_alphanumeric}")
    self.save
    nova_senha
  end
# Fim Métodos ------------------------------------------------------------------
end

