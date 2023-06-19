# json.tests @tests do |test|
#   json.name test.name
#   json.age test.age
# end


json.tests @tests, partial: "api/v1/tests/test", as: :test
