require_relative './main'

RSpec.describe 'el main' do 
	it 	'llamar metodo' do
		expect(hola_mundo).to eq 'Tengo Hambre!'
	end
end