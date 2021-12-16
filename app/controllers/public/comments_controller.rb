class Public::CommentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end


  def new
    @comment = Comment.new
  end

  def create
		@item = Item.find(params[:comment][:item_id])
		@comment = Comment.new(comment_params)
		@comment.item_id = @item.id
		@comment.customer_id = current_customer.id
		if @comment.save
  		redirect_to item_path(@item.id)
		else
		  render 'items/show'
		end
	end

	def destroy
  	comment = Comment.find(params[:id])
		comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:title, :comment)
	end
end
