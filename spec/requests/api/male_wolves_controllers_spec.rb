require 'swagger_helper'

RSpec.describe 'api/male_wolves', type: :request do
    path '/male_wolves' do

        get 'Fetch the male wolves' do
          tags 'male wolves'
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
            let(:available_puppies) { { name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20 } }
            run_test!
          end
        end
    end

    path '/male_wolves/{id}' do

        get 'Retrieves a male wolf' do
          tags 'male wolf'
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
