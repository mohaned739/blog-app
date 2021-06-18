class CommentsController < ApplicationController
    before_action :authenticate

    def create
        comment =Comment.create(
                body: params[:body],
                user_id: @user.id,
                post_id: params[:post_id]
            )
            if comment.save
                render json: {status: 'Success', message: 'Comment Created',data: comment},status: :ok
            else
                render json: {status: 'Error', message: 'Comment not saved',data: comment.errors},status: :unprocessable_entity
            end
    end

    def update
        comment = Comment.find(params[:id])
        if comment[:user_id]==@user.id
            if comment.update(
                body: params[:body]
                 )
                render json: {status: 'Success', message: 'Comment Updated',data: comment},status: :ok
            else
                render json: {status: 'Error', message: 'Comment not updated',data: comment.errors},status: :unprocessable_entity
            end
        else
            render json: {status: 'Error', message: 'Cannot edit others comments',data: comment.errors},status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment[:user_id]==@user.id
            comment.destroy
            render json: {status: 'Success', message: 'Comment Deleted',data: comment},status: :ok
        else
            render json: {status: 'Error', message: 'Cannot delete others comments',data: comment.errors},status: :unprocessable_entity
        end
    end


end
