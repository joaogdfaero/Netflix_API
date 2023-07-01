require 'csv'

module Api
    module V1
        class NetflixesController < ApplicationController
            skip_before_action :verify_authenticity_token, only: [:import_csv]
            before_action :set_netflix, only: %i[show update destroy]

            # GET /netflixes
            def index
                @netflixes = Netflix.all

                render json: @netflixes
            end

            # GET /netflixes/1
            def show
                @netflix = Netflix.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Netflix Title', data:@netflix}, status: :ok  
            end

            # POST /netflixes
            def create
              @netflix = Netflix.new(netflix_params)

              if @netflix.save
                render json: {status: 'SUCCESS', message: 'Saved Netflix', data:@netflix}, stauts: :ok
              else
                render json: {status: 'ERROR', message: 'Netflix not saved', data:@netflix.errors}, status: :unprocessable_entity
              end
            end

            # PATCH/PUT /netflixes/1
            def update
                if @netflix.update(netflix_params)
                    render json: {status: 'SUCCESS', message: 'Updated Netflix', data:@netflix}, stauts: :ok
                else
                    render json: {status: 'ERROR', message: 'Netflix not updated', data:@netflix.errors}, status: :unprocessable_entity
            
                end    
            end

            # DELETE /titles/1
            def destroy
                @netflix = Netflix.find(params[:id])
                @netflix.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Netflix', data:@netflix}, stauts: :ok
            end

            # TEST
            def method_test
                render json: { message: "Deu certo (teste)!" }, status: :ok
            end

            # IMPORT_CSV
            def import_csv
                errors = []

                CSV.foreach(params[:csv].path, headers: true) do |row|
                    begin
                        Netflix.create( id_csv: row[0], genre: row[1], title: row[2], director: row[3], cast: row[4],
                      country: row[5], year: row[6], year: row[7], rating: row[8], duration: row[9],
                      listed_in: row[10], description: row[11])
                    
                    rescue Exception => error
                        errors << error.message
                    end
                end

                if errors.blank?
                    render json: { first_message: "Arquivo CSV importado com sucesso!" }, status: :ok
                else
                    render json: { first_message: errors.join(', ') }, status: :unprocessable_entity
                end  
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_netflix
                @netflix = Netflix.find(params[:id])
            end

            def netflix_params
                params.require(:netflix).permit(:id_csv, :genre, :title, :director, :cast, :country,
                                                :published_at, :year, :rating, :duration, :listed_in, :description)
            end
        end
    end
end