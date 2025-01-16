# Paily
## Android Keystore
Pass: Paily@ppKeyT00l@

## Giải thích folders
- **core**: Chứa các class cốt lõi, ít thay đổi, không phụ thuộc vào các module khác.
- **shared**: Chứa các class dùng chung cho nhiều modulem, tái sử dụng, thay đổi nhiều.
- **modules**: Chứa các module chính của ứng dụng, mỗi module là một tính năng riêng biệt, không phụ thuộc vào các module khác.

## NOTE
Ở version hiện tại cần sử dụng thư viện cloud_firestore để triển khai MVP. Sau này có API thì cần xoá để giảm tốc độ build.