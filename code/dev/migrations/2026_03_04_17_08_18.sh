# curl -i -X POST http://localhost:8001/services/ \
#   --data "name=countdown-commands-service" \
#   --data "url=https://countdown-commands-service.toeichust.me"

# curl -i -X POST http://localhost:8001/services/ \
#   --data "name=countdown-queries-service" \
#   --data "url=https://countdown-queries-service.toeichust.me"

# curl -i -X POST http://localhost:8001/services/countdown-commands-service/routes \
#   --data "name=target-commands-route" \
#   --data "paths[]=/api/target" \
#   --data "methods[]=PATCH" \
#   --data "methods[]=POST" \
#   --data "methods[]=PUT" \
#   --data "methods[]=DELETE" \
#   --data "strip_path=false"

# curl -i -X POST http://localhost:8001/services/countdown-queries-service/routes \
#   --data "name=target-queries-route" \
#   --data "paths[]=/api/target" \
#   --data "methods[]=GET" \
#   --data "methods[]=OPTIONS" \
#   --data "strip_path=false"
