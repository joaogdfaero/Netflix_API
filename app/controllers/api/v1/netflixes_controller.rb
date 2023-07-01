require 'csv'

module Api
    module V1
        class NetflixesController < ApplicationController
            #GET /netflixes
            def index
                @netflixes = Netflix.all

                render json: @netflixes
            end

            # TEST
            def method_test
                render json: { message: "Deu certo (teste)!" }, status: :ok
            end

        end
    end
end