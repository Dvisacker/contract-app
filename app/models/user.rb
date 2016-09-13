class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  has_many :comments, dependent: :destroy
  has_many :submissions

   def index
     @users = User.all
   end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end

def mailboxer_name
  self.name
end

def mailboxer_email(object)
  self.email
 #return the model's email here
end
end

