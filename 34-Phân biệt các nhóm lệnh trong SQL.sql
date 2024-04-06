Phân biệt các nhóm lệnh SQL
* SQL là gì?
SQL(Structured Query Language) là 1 ngôn ngữ lập trình dc sử dụng để thao tác với dữ liệu
trong cơ sở dữ liệu quan hệ. SQL dc sử dụng để tạo,truy vấn,thay đổi và xóa dữ liệu trong 
csdl
* SQL có thể được chia thành 4 nhóm chính,
  + DML(Data Manipulation Language): Các câu lệnh DML dc sử dụng để thao tác với dữ liệu trong csdl, bao gồm
  câu lệnh chèn, cập nhật, xóa và truy vấn
  + DDL(Data Definition Language): Các câu lệnh DDL dc sử dụng để định nghĩa cấu trúc của csdl, bao gồm các bảng
  ,cột,chỉ mục và ràng buộc
  + DCL(Data Control Language): Các câu lệnh DCL dc sử dụng để kiểm soát quyền truy cập vào csdl, bao gồm các câu lệnh
  cấp phép và thu hồi quyền
  + TCL(Transaction Control Language): Các câu lệnh TCL dc sử dụng để quản lí các giao dịch trong csdl, bao gồm các câu
  lệnh bắt đầu, xác nhận và hoàn tác giao dịch

* DML 
  + Các câu lệnh DML dc sử dụng để thao tác vs dữ liệu trong csdl. Các câu lệnh DML thường dc sử dụng để thêm, cập nhật, xóa hoặc truy vấn dữ liệu
  + INSERT INTO: Chèn dữ liệu vào 1 bảng
  + UPDATE: Cập nhật dữ liệu trong 1 bảng
  + DELETE: Xóa dữ liệu từ 1 bảng
  + SELECT: Truy vấn dữ liệu từ 1 hoặc nhiều bảng
* DDL 
  + Các câu lệnh DDL dc sử dụng để định nghĩa cấu trúc của csdl. Các câu lệnh DDL thường dc sử dụng khi tạo csdl mới hoặc khi thay đổi cấu trúc csdl hiện có
  + Create TABLE: Tạo 1 bảng mới
  + ALTER TABLE: Thêm, xóa hoặc sữa đổi các cột trong bảng
  + DROP TABLE: Xóa 1 bảng
  + CREATE INDEX: Tạo một chỉ mục cho 1 cột hoặc tập hợp các cột
  + DROP INDEX: Xóa 1 chỉ mục
  + CREATE CONSTRAINT : Tạo 1 ràng buộc cho 1 cột hoặc tập hợp các cột
  + DROP CONSTRAINT: Xóa 1 ràng buộc
* DCL
  + Các câu lệnh DCL dc sử dụng để kiểm soát quyền truy cập vào csdl. Các câu lệnh DCL thường dc sử dụng để cấp quyền truy cập cho người dùng hoặc thu hồi quyền truy Cập
  + GRANT: Cấp quyền truy cập người dùng
  + REVOKE: Thu hồi quyền truy cập cho người dùng
* TCL
  + Các câu lệnh TCL dc sử dụng để quản lý các giao dịch trong csdl. Các câu lệnh TCL thường dc sử dụng để đảm bảo tính toàn vẹn dữ liệu trong trường hợp xảy ra lỗi
  + BEGIN TRANSACTION: Bắt đầu 1 giao dịch
  + COMMIT TRANSACTION: Xác nhận 1 giao dịch
  + ROLLBACK TRANSACTION: Hoàn tất 1 giao dịch