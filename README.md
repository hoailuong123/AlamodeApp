# Toysrus - Ứng dụng Thương Mại Điện Tử Đồ Chơi
## Mục lục
- [Toysrus - Ứng dụng Thương Mại Điện Tử Đồ Chơi](#toysrus---ứng-dụng-thương-mại-điện-tử-đồ-chơi)
  - [Mục lục](#mục-lục)
  - [1. Giới thiệu tổng quan](#1-giới-thiệu-tổng-quan)
  - [2. Chức năng chính của ứng dụng](#2-chức-năng-chính-của-ứng-dụng)
  - [3. Cấu trúc thư mục dự án](#3-cấu-trúc-thư-mục-dự-án)
  - [4. Project Pattern](#4-project-pattern)
  - [5. Tech Stack](#5-tech-stack)
  - [6. Third-Party Libraries](#6-third-party-libraries)
  - [7. Code Styles](#7-code-styles)
  - [8. Cách tiếp cận dự án](#8-cách-tiếp-cận-dự-án)
  - [9. Cách xử lý task](#9-cách-xử-lý-task)

---
## 1. Giới thiệu tổng quan

*Toysrus là một dự án thương mại điện tử dành riêng cho đồ chơi trẻ em, giúp người dùng dễ dàng tiếp cận chương trình khuyến mãi, chiến dịch, lưu mã giảm giá, tích điểm hội viên, mua sắm và quản lý đơn hàng.*

---
## 2. Chức năng chính của ứng dụng
 🏷️ **Liên kết hội viên**
- Đăng nhập bằng tài khoản hội viên
- Đăng ký tài khoản hội viên mới

 🏷️ **Quản lý tài khoản & xem quyền lợi hội viên**
- Hiển thị chứng nhận hội viên (rank, số point sở hữu, thời hạn có hiệu lực,...)
- Xem lịch sử điểm, lịch sử đặt hàng trực tuyến
- Thay đổi thông tin đăng ký

 🏷️ **Xem thông tin quảng bá sản phẩm**
- Xem quảng bá thông tin, chiến dịch theo danh mục
- Xem chi tiết từng sự kiện

 🏷️ **Thanh toán**
- Cập nhật phương thức thanh toán qua thẻ PayPay, auPay,...

 🏷️ **Ưu đãi**
- Hiển thị danh sách coupon và hạn sử dụng
- Hiển thị các coupon yêu thích

 🏷️ **Xem vị trí trên bản đồ**
- Xem các cửa hàng gần vị trí hiện tại
- Tìm kiếm các cửa hàng với bộ lọc
- Chỉ đường đến cửa hàng khi chuyển qua bản đồ của OS

 🏷️ **Nhận thông báo**
- Nhận thông báo về coupon, tin tức

 🏷️ **Liên kết mạng xã hội**
- Cung cấp các đường dẫn đến mạng xã hội X, Line, Facebook, Instagram, TikTok, YouTube của Toysrus.

 🏷️ **Xem thông tin chính sách & hướng dẫn**
- Tích hợp WebView để hiển thị trang web chính sách mua hàng, điều khoản sử dụng, hướng dẫn sử dụng,...

---
## 3. Cấu trúc thư mục dự án
```
ma2-a0231-android-toysrus/                            
├── appnavigation/                           # Module điều hướng ứng dụng 
├── apputil/                                 # Module tiện ích dùng chung
├── appversioning/                           # Module quản lý phiên bản
├── coreapp/                                 # Module chính chứa logic cốt lõi và UI
│   ├── src/                                
│   │   ├── main/                        
│   │   │   ├── java/com/locationvalue/ma2/
│   │   │   │               ├── analytics/  # Chứa lớp phân tích dữ liệu, theo dõi sự kiện người dùng
│   │   │   │               ├── app/        # Khởi tạo ứng dụng & Cấu hình toàn cục
│   │   │   │               ├── components/ # Thành phần giao diện custom
│   │   │   │               ├── enums/      # Định nghĩa hằng số và trạng thái cố định
│   │   │   │               ├── model/      # Mô hình dữ liệu
│   │   │   │               ├── navigation/ # Điều hướng và logic chuyển màn hình
│   │   │   │               ├── remote/     # Xử lý kết nối mạng, API Service, cấu hình gọi API
│   │   │   │               ├── utils/      # Các lớp tiện ích
│   │   │   │               ├── view/       # Giao diện người dùng
│   │   │   │               │   ├── adapter/    # Adapter hiển thị danh sách dữ liệu
│   │   │   │               │   ├── base/       # Chứa các lớp cơ sở cho Activity/Fragment, tái sử dụng mã
│   │   │   │               │   ├── interfaces/ # Định nghĩa quan hệ giữa các lớp
│   │   │   │               │   └── pages/      # Các màn hình chính của ứng dụng
│   │   │   │               │       └── home/   # Các lớp trang home, gồm HomeActivity, HomeFragment
│   │   │   ├── res/                            # Thư mục chứa tài nguyên ứng dụng
│   │   │   │   ├── drawable/                   # Chứa tài nguyên hình ảnh, icon, hình nền
│   │   │   │   ├── font/                       # Chứa tệp font chữ tùy chỉnh
│   │   │   │   ├── layout/                     # Chứa tệp XML định nghĩa giao diện 
│   │   │   │   ├── values/                     # Chứa tài nguyên giá trị, như strings.xml, colors.xml
│   │   │   │   └── mipmap/                     # Chứa icon ứng dụng cho các độ phân giải khác nhau
│   │   │   ├── AndroidManifest.xml             # Cấu hình ứng dụng
│   │   ├── public/                             # Chứa tài nguyên môi trường công khai
│   │   ├── sandbox/                            # Chứa tài nguyên môi trường thử nghiệm
│   ├── build.gradle                            # Cấu hình build module coreapp
├── build.gradle                                # Cấu hình build chính
├── build_settings.gradle                       # Tệp cài đặt cho build
├── app_settings.gradle                         # Tệp cấu hình ứng dụng và thư viện
├── dep_settings.gradle                         # Cài đặt dependency
├── settings.gradle                             # Tệp cấu hình toàn cục

```

---
## 4. Project Pattern
Dự án tuân theo mô hình **MVVM (Model-View-ViewModel)**:
- **Model:** Model biểu diễn dữ liệu và logic nghiệp vụ của ứng dụng. Nó bao gồm các lớp dữ liệu, kho lưu trữ và nguồn dữ liệu.
- **View:** View chịu trách nhiệm hiển thị dữ liệu cho người dùng và xử lý các tương tác của người dùng. Nó bao gồm các hoạt động, đoạn mã và tệp bố cục XML.
- **ViewModel:** ViewModel đóng vai trò là cầu nối giữa Model và View. Nó chứa dữ liệu và logic nghiệp vụ mà View yêu cầu và xử lý các hành động của người dùng.

---
## 5. Tech Stack
 📌 **Programming Languages**
- Kotlin

 📌 **Build System**
- Gradle

 📌 **Android Libraries**
- Lifecycle (ViewModel, LiveData) – Quản lý vòng đời component và dữ liệu.

- Navigation Component – Điều hướng giữa các Fragment và Activity.

 📌 **Networking & Data Handling**
- Retrofit – Interface các RESTful API 
- OkHttp – HTTP Client, caching, logging.

 📌 **Data Storage**
- SharedPreference - Lưu trữ cục bộ

 📌 **Synchronous Programming**
- Kotlin Coroutines – Xử lý đa luồng, tối ưu hiệu suất.

 📌 **Permissions Handling**
- Permissions Dispatcher – Quản lý quyền trong Android.

 📌 **Testing Framework**
- JUnit – Kiểm thử đơn vị.
- Espresso – Kiểm thử UI tự động.

---
## 6. Third-Party Libraries
- **Firebase Libraries**:  
  - Messaging: `v23.1.2`  
  - Analytics: `v22.2.1`  
  - Crashlytics: `v18.4.1`  

- **Google Play Services Libraries**:  
  - Location: `v20.0.0`  
  - Maps: `v18.1.0`  

- **Moshi**: `v2.9.0`  
- **OkHttp**: `v4.12.0`  
- **Retrofit**: `v2.9.0`  
- **Permissions Dispatcher**: `v4.9.1`  
- **Glide**: `v4.16.0`  
- **ModuleApp**: NautilusSDK `v2.0`  

---
## 7. Code Styles
- Thực hiện theo code convention của Kotlin.
- Sử dụng tên biến và phương thức có ý nghĩa.
- Các hàng số phải viết in hoa: UPPER_CASE
- Giữ độ dài dòng tối đa là 100 ký tự.
- Sử dụng 4 khoảng trắng để thụt lề.

---
## 8. Cách tiếp cận dự án
📍 **Tìm hiểu về dự án**
- Đọc tài liệu dự án, như các file spec chi tiết, file list chức năng, file Q&A,...  
- Tìm hiểu cấu trúc codebase trên GitLab để hiểu cách tổ chức mã nguồn.
- Tìm hiểu công nghệ sử dụng trong dự án: MVVM, Retrofit, Git,...
- Trao đổi, xác nhận với mentor/supporter các công nghệ sử dụng trong dự án

📍 **Cài đặt môi trường**
- Clone repository và thiết lập dự án trên Android Studio.
- Cấu hình các công cụ cần thiết như Gradle, Emulator.
- Chạy thử ứng dụng trên Emulator.

📍 **Hiểu quy trình làm việc**
- Nắm rõ quy trình làm việc với Git (branching, commit message convention, code review process).
- Học cách sử dụng CI với GitLab Actions để kiểm tra trước khi merge vào code init_source.

📍 **Bắt đầu nhận task**
- Nhận task và hiểu rõ yêu cầu của task
- Hỏi mentor/supporter khi gặp khó khăn, đảm bảo hiểu rõ yêu cầu trước khi bắt đầu.
- Triển khai code theo coding convention.
- Tạo Merge Request (MR)  để yêu cầu review.

📍 **Học hỏi và cải thiện**
- Đọc feedback từ reviewers và cải thiện code.
- Nghiên cứu các best practices để viết code tối ưu, dễ bảo trì.
- Học cách debug, tối ưu hiệu suất.

---
## 9. Cách xử lý task
👉 **Hiểu rõ task**
- Đọc các tài liệu mô tả liên quan đến task, xem file XD để hiểu UI.
- Xác định mục tiêu của task, đầu vào (input) và đầu ra (output) mong muốn.
- Kiểm tra xem có tài liệu liên quan, codebase và các quyết định thiết kế thay đổi không.
- Nếu có gì chưa rõ, hỏi mentor/supporter

👉 **Lên kế hoạch & phân chia công việc**
- Xác định phân loại task: bug fix, feature, refactoring, optimization…
- Ước lượng thời gian hoàn thành 
- Sắp xếp mức độ ưu tiên

👉 **Tiến hành thực hiện**
- Tạo nhánh mới trên git: Checkout branch và đặt tên theo quy tắc của dự án (tên_ngày_chức năng) Ví dụ: luonglth_13_march_payment
- Viết code theo coding convention của mentor cung cấp.
- Chạy thử chương trình để kiểm tra lỗi.
- Commit code với mô tả rõ ràng.

👉 **Kiểm tra & hoàn thiện**
- Tự kiểm tra lại code trước khi push.
- Chạy thử toàn bộ tính năng trên thiết bị thật hoặc máy ảo để đảm bảo phần triển khai không ảnh hưởng đến toàn bộ ứng dụng.
- Kiểm tra trên nhiều màn hình Android khác nhau.

👉 **Tạo Merge Request (MR) & chờ review**
- Push code lên GitLab dự án và tạo Merge Request.
- Mô tả rõ những gì đã làm, chức năng,.. trong Description khi tạo MR.
- Tag tên người reviewer và thông báo đã tạo MR.
- Nhận feedback từ reviewer, sửa lỗi nếu cần.
- Khi được approve, merge vào nhánh chính và kiểm tra lại sau khi merge.

👉 **Cập nhật trạng thái**
- Thông báo, nhắn tin cho mentor/supporter khi cập nhật trạng thái task (done, in review,..)

---
