class TagsController < ApplicationController

    def create
        tag =Tag.create(
                body: params[:body],
                post_id: params[:post_id]
            )
            if tag.save
                render json: {status: 'Success', message: 'Tag Created',data: tag},status: :ok
            else
                render json: {status: 'Error', message: 'Tag not saved',data: tag.errors},status: :unprocessable_entity
            end
    end

    def update
        tag = @tags.find(params[:id])
            if tag.update(
                body: params[:body]
                )
                render json: {status: 'Success', message: 'Tag Updated',data: tag},status: :ok
            else
                render json: {status: 'Error', message: 'Tag not updated',data: tag.errors},status: :unprocessable_entity
            end
    end

    def destroy
        tag = @tags.find(params[:id])
        tagsCount = @tags.where(post_id: tag.post_id).count

        if tagsCount>1
            tag.destroy
            render json: {status: 'Success', message: 'Tag Deleted',data: tag},status: :ok
        else
            render json: {status: 'Error', message: 'Post must have at least one tag'},status: :unprocessable_entity
        end
    end
end
