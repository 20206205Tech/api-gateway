# 1. Tạo Service trỏ đến Supabase Auth
curl -i -X POST http://localhost:8001/services \
  --data name=supabase-auth-service \
  --data url=https://bzndvawmtwfxpvvhecwm.supabase.co/auth/v1

# 2. Tạo Route để truy cập từ bên ngoài
curl -i -X POST http://localhost:8001/services/supabase-auth-service/routes \
  --data "paths[]=/api/auth" \
  --data strip_path=true \
  --data name=supabase-auth-route


# 1. Tạo Service cho Supabase Storage
curl -i -X POST http://localhost:8001/services \
  --data name=supabase-storage-service \
  --data url=https://bzndvawmtwfxpvvhecwm.supabase.co/storage/v1

# 2. Tạo Route cho Storage
curl -i -X POST http://localhost:8001/services/supabase-storage-service/routes \
  --data "paths[]=/api/storage" \
  --data strip_path=true \
  --data name=supabase-storage-route

  