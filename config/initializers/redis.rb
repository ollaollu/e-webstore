#Ohm.redis = Redic.new("redis://127.0.0.1:6379")

$redis = Redis.new(:driver => :hiredis)
