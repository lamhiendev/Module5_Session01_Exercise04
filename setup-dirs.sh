#!/bin/bash

# Dừng script ngay nếu có lệnh nào gặp lỗi
set -e

# 1. Tạo thư mục làm việc của dự án (/opt/quickbite/user-service)
# Cờ -p giúp tạo đồng thời thư mục cha /opt/quickbite và thư mục con user-service
sudo mkdir -p /opt/quickbite/user-service

# 2. Thay đổi chủ sở hữu và nhóm sở hữu cho toàn bộ cây thư mục /opt/quickbite
# Cờ -R (Recursive) áp dụng đệ quy cho thư mục cha và mọi thư mục con/tập tin bên trong
sudo chown -R quickbite:quickbite /opt/quickbite

# 3. Thiết lập quyền truy cập 750 cho thư mục /opt/quickbite
sudo chmod -R 750 /opt/quickbite

# ==============================================================================
# GIẢI THÍCH Ý NGHĨA MÃ SỐ PHÂN QUYỀN 750 (drwxr-x---):
# Trong Linux, quyền hạn được tính theo công thức cộng dồn: 4 (Read - r), 2 (Write - w), 1 (Execute - x).
# - Số 7 (4 + 2 + 1 = rwx) - Chủ sở hữu (Owner - user 'quickbite'): Có toàn quyền đọc, ghi/sửa/xóa và truy cập vào thư mục.
# - Số 5 (4 + 0 + 1 = r-x) - Nhóm sở hữu (Group - group 'quickbite'): Chỉ có quyền đọc danh sách và truy cập vào thư mục, không được phép chỉnh sửa hay xóa file.
# - Số 0 (0 + 0 + 0 = ---) - Người dùng khác (Others): Hoàn toàn không có bất kỳ quyền truy cập, đọc hay ghi nào, đảm bảo an toàn cho file cấu hình nhạy cảm.
# ==============================================================================

echo "Thiet lap thu muc /opt/quickbite/user-service va phan quyen 750 thanh cong!"
