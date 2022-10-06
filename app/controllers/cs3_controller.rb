class Cs3Controller < ApplicationController
    def main
        if session[:login_uid]!= nil
            render "main"
        else
            render "login"
        end
    end

    def login
        # inputpass=BCrypt::Password.create(params[:password])

        if User.find_by(uid: params[:uid])
            userpass=User.find_by(uid: params[:uid]).pass
            # 注意：演算子がオーバーロードされてる
            if BCrypt::Password.new(userpass)==params[:password]
                session[:login_uid] = params[:uid]
                redirect_to "/"
            else
                session[:login_uid] = nil
                flash[:notice] = "not match password"
                render "login"
            end
        else
            flash[:notice] = "not match userid"
            render "login"
        end
    end

    def del_sesson
        session.delete(:login_uid)
        redirect_to "/"
    end
end
