class BugsController < ApplicationController
    include BugsHelper
    before_action :authenticate_user!

    def index
            @bugs = Bug.all.includes(:assginee) if current_user.role == 'Manager'
            @bugs = Bug.where(user_id: current_user.id) if current_user.role == 'QA'
            @bugs = Bug.where(assgined_to: current_user.id) if current_user.role == 'developer'
            @user = User.where.not(role: 'Manager')

    end

    def edit
        # byebug
        @status = ['started', 'Under Progress', 'fixed'] if current_user.role == 'Manager'
        @status = ['started', 'Under Progress', 'fixed'] if current_user.role == 'QA'
        @status = ['started', 'fixed'] if current_user.role == 'developer'
    
    end

    def new
        @bug = Bug.new
    end

    

    def create
        if current_user.role != "developer"
            @bug = current_user.bugs.build(bug_params)
             if @bug.save
                flash[:success] = "bug created"
                redirect_to user_home_url
            else
                flash[:danger] = "bug could not be created"
                redirect_to new_bug_path
            end
        else
            flash[:danger] = "you are not allowed to create a bug"
            redirect_to user_home_path
        end
    end

    def update
        bug = Bug.find(params[:id])

        if current_user.role == 'QA' && current_user.id == bug.user_id
                update_att(bug,:status,params[:status],'Status Updated!')
                redirect_to bugs_path

        elsif current_user.role == 'developer' && current_user.id == bug.assginee.id
                update_att(bug,:status,params[:status], 'Status Updated!')
                redirect_to bugs_path      
        elsif current_user.role == 'Manager'
            update_att(bug,:status,params[:status], 'Status Updated!')
            redirect_to bugs_path
        else
            flash[:danger] = "sorry! Something went wrong."
            redirect_to bugs_path
        end
        

    end

    def assginment
        if current_user.role == "Manager"
                bug = Bug.find(params[:id])
                update_att(bug,:assgined_to,params[:user_id], 'Bug Assgined!')             
                redirect_to bugs_path
        end
    end

    def add_comments
            bug = Bug.find(params[:id])
        if current_user.role == "developer" && current_user.id == bug.assginee.id
            update_att(bug, :comments, params[:comments], 'Comment Added!')
            redirect_to bugs_path
        else
            flash[:danger] = "You are not allowed to add a comment"
            redirect_to bugs_path
        end
    end


    private 
        def bug_params
            params.require(:bug).permit(:title, :description, :priority, :ETC)
        end

end
