# 1. Tạo Upstream (Không thay đổi)
curl -i -X POST http://localhost:8001/upstreams \
--data "name=httpbin-upstream" \
--data "algorithm=round-robin" \
--data "hash_on=none" \
--data "hash_fallback=none" \
--data "slots=10000" \
--data "healthchecks.threshold=0"

# 2. Tạo Target: Đổi port từ 80 sang 443
curl -i -X POST http://localhost:8001/upstreams/httpbin-upstream/targets \
--data "target=httpbin.org:443" \
--data "weight=1"

# 3. Tạo Service: Đổi protocol sang https và port sang 443
curl -i -X POST http://localhost:8001/services \
--data "name=httpbin" \
--data "host=httpbin-upstream" \
--data "port=443" \
--data "protocol=https" \
--data "connect_timeout=60000" \
--data "read_timeout=60000" \
--data "write_timeout=60000" \
--data "retries=5"

# 4. Tạo Route (Không thay đổi, cho phép client gọi vào Kong bằng cả http/https)
curl -i -X POST http://localhost:8001/services/httpbin/routes \
--data "name=httpbin_route" \
--data "paths[]=/api/httpbin" \
--data "strip_path=true" \
--data "protocols[]=http" \
--data "protocols[]=https"
