require 'swagger_helper'

RSpec.describe 'api/available_puppies', type: :request do
    path '/available_puppies' do

        get 'Fetch the available puppies' do
          tags 'Available Puppies'
          consumes 'application/json'
          parameter name: :puppy, in: :query, type: :object, properties: {
            name: { type: :string },
            date_of_birth: { type: :date },
            picture: { type: :string },
            weight: { type: :integer },
            description: { type: :string },
            gender: { type: :string },
            father: { type: :string },
            mother: { type: :string },
            wolf_percentage: { type: :integer },
            availability: { type: :boolean }
          }, required: [ 'name', 'date_of_birth', 'picture', 'weight', 'description', 'gender', 'father', 'mother', 'wolf_percentage', 'availability' ]
    
          response '200', 'puppies fetched' do
            let(:available_puppies) { { name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', gender: 'male', father: 'father', mother: 'mother', wolf_percentage: 20, availability: true } }
            run_test!
          end
        end
    end

    path '/available_puppies/{id}' do

        get 'Retrieves a pup' do
          tags 'available pup'
          consumes 'application/json'
          parameter name: :id, in: :path, type: :string
          request_body_example = {
            name: 'foo',
            date_of_birth: '12/12/12',
            picture: 'https://heteryrr.com',
            weight: 12,
            description: 'description',
            gender: 'male',
            father: 'father',
            mother: 'mother',
            wolf_percentage: 20,
            availability: true
          }
    
          response '200', 'pup found' do
            schema type: :object,
              properties: {
                id: { type: :integer },
                name: 'foo',
                date_of_birth: '12/12/12',
                picture: 'https://heteryrr.com',
                weight: 12,
                description: 'description',
                gender: 'male',
                father: 'father',
                mother: 'mother',
                wolf_percentage: 20,
                availability: true  
                
              },
              required: [ 'id', 'name', 'date_of_birth', 'picture', 'weight', 'description', 'gender', 'father', 'mother', 'wolf_percentage', 'availability' ]
    
            let(:id) { AvailablePuppy.create(name: 'foo', date_of_birth: '12/12/12', picture: 'https://heteryrr.com', weight: 12, description: 'description', gender: 'male', father: 'father', mother: 'mother', wolf_percentage: 20, availability: true).id }
            run_test!
          end
    
          response '404', 'pup not found' do
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
