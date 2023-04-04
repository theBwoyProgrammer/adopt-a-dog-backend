require 'swagger_helper'

RSpec.describe 'api/female_wolves', type: :request do
    path '/female_wolves' do

        get 'Fetch the female wolves' do
          tags 'female wolves'
          consumes 'application/json'
          parameter name: :femaleWolf, in: :query, type: :object, properties: {
            name: { type: :string },
            date_of_birth: { type: :date },
            picture: { type: :string },
            weight: { type: :integer },
            description: { type: :string },
            wolf_percentage: { type: :integer }
          }, required: [ 'name', 'date_of_birth', 'picture', 'weight', 'description', 'wolf_percentage' ]
    
          response '200', 'female wolves fetched' do
            let(:available_puppies) { { name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20 } }
            run_test!
          end
        end
    end

    path '/female_wolves/{id}' do

        get 'Retrieves a female wolf' do
          tags 'female wolf'
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
    
          response '200', 'female wolf found' do
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
    
            let(:id) { FemaleWolf.create(name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', wolf_percentage: 20).id }
            run_test!
          end
    
          response '404', 'female wolf not found' do
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
