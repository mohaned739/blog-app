class PostsController < ApplicationController

    def index
        # posts = Post.order('created_at DESC')
        posts = @posts
        render json: {status: 'Success', message: 'Loaded Posts',data: posts},status: :ok
    end
    def create
            post =Post.create(
                title: params[:title],
                body: params[:body],
                user_id: @user.id
            )
            tag = Tag.create(
            body: params[:tagbody],
            post_id: post.id
            )
            HardWorker.perform_in(24.hours,post.id)
            if  tag.save
                if post.save
                    render json: {status: 'Success', message: 'Post saved',data: post},status: :ok
                else
                    render json: {status: 'Error', message: 'Post not saved',data: post.errors},status: :unprocessable_entity
                end
            else
                post.destroy
                render json: {status: 'Error', message: 'Post Must Have tag',data: tag.errors},status: :unprocessable_entity
            end
    end

    def update
        post = @posts.find(params[:id])
        if post[:user_id]==@user.id
            if post.update(
                title: params[:title],
                body: params[:body]
                 )
                render json: {status: 'Success', message: 'Post Updated',data: post},status: :ok
            else
                render json: {status: 'Error', message: 'Post not updated',data: post.errors},status: :unprocessable_entity
            end
        else
            render json: {status: 'Error', message: 'Cannot edit others posts',data: post.errors},status: :unprocessable_entity
        end
    end

    def destroy
        post = @posts.find(params[:id])
        if post[:user_id]==@user.id
            tags = @tags.where(post_id: post.id).destroy_all
            comments = @comments.where(post_id: post.id).destroy_all
            post.destroy

            render json: {status: 'Success', message: 'Post Deleted',data: post},status: :ok
        else
            render json: {status: 'Error', message: 'Cannot delete others posts',data: post.errors},status: :unprocessable_entity
        end
    end



end
