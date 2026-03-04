# Mặc định là 100
curl -X POST http://localhost:8001/plugins \
--data "name=rate-limiting" \
--data "config.minute=50" \
--data "config.policy=local"

# Nếu là kong-api-gateway thì áp dụng rate-limiting là 1000
curl -i -X POST http://localhost:8001/consumers/kong-api-gateway/plugins \
  --data "name=rate-limiting" \
  --data "config.minute=1000" \
  --data "config.policy=local"
