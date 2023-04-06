require 'swagger_helper'

RSpec.describe 'api/male_wolves', type: :request do
    path '/male_wolves' do

      post 'Creates a male wolf' do
        tags 'Creates a male wolf'
        consumes 'application/json'
        parameter name: :maleWolf, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            date_of_birth: { type: :date },
            picture: { type: :string },
            weight: { type: :integer },
            description: { type: :string },
            wolf_percentage: { type: :integer },
          },
          required: [ 'name', 'date_of_birth', 'picture', 'weight', 'description', 'wolf_percentage' ]
        }

        response '201', 'Male wolf created' do
          let(:maleWolf) { { name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20 } }
          run_test!
        end
    end

        get 'Fetch the male wolves' do
          tags 'Retrieves all male wolves'
          consumes 'application/json'
          parameter name: :maleWolf, in: :query, type: :object, properties: {
            name: { type: :string },
            date_of_birth: { type: :date },
            picture: { type: :string },
            weight: { type: :integer },
            description: { type: :string },
            wolf_percentage: { type: :integer }
          }, required: [ 'name', 'date_of_birth', 'picture', 'weight', 'description', 'wolf_percentage' ]
    
          response '200', 'male wolves fetched' do
            let(:male_wolves) { { name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20 } }
            run_test!
          end
        end
    end

    path '/male_wolves/{id}' do

        get 'Retrieves a male wolf' do
          tags 'Retrieves a male wolf'
          consumes 'application/json'
          parameter name: :id, in: :path, type: :string
          request_body_example = {
            name: 'foo',
            date_of_birth: '12/12/12',
            picture: 'https://heteryrr.com',
            weight: 12,
            description: 'description',
            wolf_percentage: 20
          }
    
          response '200', 'male wolf found' do
            schema type: :object,
              properties: {
                id: { type: :integer },
                name: 'foo',
                date_of_birth: '12/12/12',
                picture: 'https://heteryrr.com',
                weight: 12,
                description: 'description',
                wolf_percentage: 20
                
              },
              required: [ 'id', 'name', 'date_of_birth', 'picture', 'weight', 'description', 'wolf_percentage' ]
    
            let(:id) { MaleWolf.create(name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20).id }
            run_test!
          end

          put 'Updates a male wolf' do
            tags 'Updates a male wolf'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :string
            parameter name: :maleWolf, in: :body, schema: {
              type: :object,
              properties: {
                name: { type: :string },
                date_of_birth: { type: :date },
                picture: { type: :string },
                weight: { type: :integer },
                description: { type: :string },
                wolf_percentage: { type: :integer }
              }
            }
      
            response '200', 'Male updated' do
              let(:id) { MaleWolf.create(name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20).id }
              let(:maleWolf) { { name: 'bar', date_of_birth: '11/11/11', picture: 'https://heteryrr.com', weight: 10, description: 'description', wolf_percentage: 30 } }
              run_test!
            end
          end

          delete 'Deletes a male wolf' do
            tags 'Deletes Male wolf'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :string
      
            response '200', 'Male deleted' do
              let(:id) { MaleWolf.create(name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20).id }
              run_test!
            end
    
          response '404', 'male wolf not found' do
            let(:id) { 'invalid' }
            run_test!
          end
    
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }
            run_test!
          end
        end
      end
    end
end
