class CommentsController < CrudController
  # before_action :set_profile, only: [:new, :create]
  before_action :set_image, only: [:new, :create]
  # before_action :authenticate_image_owner, only: [:edit, :update, :destroy]
  #
  #
  # def show
  # end

  def new
    @comment = Comment.new
    @parent_id = params[:parent_id] if params[:parent_id]
  end

  # def edit
  # end
  #
  def create
    if params[:parent_id]
      @parent_id = params[:parent_id]
      parent = Comment.find(@parent_id)
      @comment = parent.children.new(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    @comment.profile = current_user.profile
    @comment.image = @image

    if @comment.save
      flash[:notice] = 'Your comment has been added!'
      redirect_to @image
    else
      render 'new'
    end
  end
  #
  # def update
  #   if @comment.update(image_params)
  #     flash[:notice] = 'Your image has been updated!'
  #     redirect_to @comment
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   @comment.destroy
  #   flash[:notice] = 'Deleted image.'
  #   redirect_to root_path
  # end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def set_image
    @image = Image.find(params[:image_id])
  end
  #
  # def set_profile
  #   @profile = Profile.find(params[:profile_id])
  # end
  #
  # def user_is_image_owner?
  #   current_user == @comment.profile.user
  # end
  # helper_method :user_is_image_owner?
  #
  # def authenticate_image_owner
  #   unless user_is_image_owner?
  #     flash[:notice] = 'You are not authorized to edit this image.'
  #     redirect_to @comment
  #   end
  # end
end
