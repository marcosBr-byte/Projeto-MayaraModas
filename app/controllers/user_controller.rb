class UserController < ApplicationController
  CHAVE_ADMIN = "ADMIN2026"

  def login
    @user = User.new
  end

  def loginAdmin
    @user = User.new
  end

  def cadastrar
    @user = User.new
  end

  def cadastrarAdmin
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
    redirect_to "/user/login"
  end

  def create_login
    dados = params_login
    @user = User.find_by(email: dados[:email])
    if @user&.authenticate(dados[:password]) && !@user.admin?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new
      flash.now[:alert] = "Email ou senha inválidos"
      render :login, status: :unprocessable_entity
    end
  end

  def create_loginAdmin
    dados = params_login
    @user = User.find_by(email: dados[:email])

    puts "EMAIL: #{dados[:email]}"
    puts "USUARIO ENCONTRADO? #{@user.present?}"

    if @user
      puts "ADMIN? #{@user.admin?}"
      puts "SENHA VALIDA? #{@user.authenticate(dados[:password]).present?}"
    end

    if @user&.authenticate(dados[:password]) && @user.admin?
      session[:user_id] = @user.id
      redirect_to "/produto/index"
    else
      @user = User.new
      flash.now[:alert] = "Email ou senha inválidos"
      render :loginAdmin, status: :unprocessable_entity
    end
  end

  def create_cadastrar
    @user = User.new(params_cadastrar)
    @user.admin = false
    if @user.save
      redirect_to "/user/login"
    else
      flash.now[:alert] = "Erro ao cadastrar"
      render :cadastrar, status: :unprocessable_entity
    end
  end

  def create_cadastrarAdmin
    if params[:user][:chaveAcesso] != CHAVE_ADMIN
      flash.now[:alert] = "Chave de acesso inválida"
      @user = User.new
      return render :cadastrarAdmin, status: :unprocessable_entity
    end
    @user = User.new(params_cadastrar)
    @user.admin = true
    if @user.save
      redirect_to "/user/loginAdmin"
    else
      puts @user.errors.full_messages
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :cadastrarAdmin, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def params_login
    params.require(:user).permit(:email, :password)
  end

  def params_cadastrar
    params.require(:user).permit(:nome,:email,:password,:password_confirmation)
  end
end