require 'dry-validation'

class NewUserContract < Dry::Validation::Contract
  params do
    required(:email).filled(:string)
    required(:age).value(:integer)
  end

  rule(:email) do
    key.failure('oi mate') if false
  end

  rule(:age) do
    key.failure('must be greater than 18') if value < 18
  end
end

contract = NewUserContract.new

pp contract.call(email: 'jane@doe.org', age: '17')
# #<Dry::Validation::Result{:email=>"jane@doe.org", :age=>17} errors={:age=>["must be greater than 18"]}>
