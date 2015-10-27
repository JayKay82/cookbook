require "reform/form/active_model/validations"
Reform::Form.class_eval do
  include Reform::Form::ActiveModel::Validations
end
# require "reform/form/lotus"
# Reform::Form.class_eval do
#   include Reform::Form::Lotus
# end
