SELECT *
INTO Customers_1
FROM Customers;

-- Xóa đi khách hàng 'ALFKI'
DELETE FROM [dbo].[Customers_1]
WHERE [CustomerID] LIKE 'ALFKI';



SELECT DISTINCT [Country] FROM [dbo].[Customers_1];
-- Xóa đi toàn bộ khách hàng có quốc gia
-- bắt đầu bằng 'U'
DELETE FROM [dbo].[Customers_1]
WHERE [Country] LIKE 'U%';


-- Xóa sạch 1 bảng
DELETE FROM [dbo].[Customers_1];

-- Câu hỏi:
-- DELETE FROM khác gì với TRUNCATE
DELETE: Câu lệnh DELETE được sử dụng để xóa các dòng (records) từ bảng dựa trên một điều kiện cụ thể. 
Khi bạn sử dụng DELETE, hệ thống sẽ xóa từng dòng một và ghi lại việc xóa này trong log, do đó có thể rollback dữ liệu nếu cần. 
DELETE cũng kích hoạt các triggers mà bạn có thể đã định nghĩa trên bảng.

TRUNCATE: TRUNCATE cũng xóa toàn bộ dữ liệu từ bảng, nhưng không sử dụng điều kiện như DELETE. 
TRUNCATE sẽ xóa toàn bộ dữ liệu trong bảng một cách nhanh chóng bằng cách giải phóng không gian lưu trữ. 
Do đó, TRUNCATE thường nhanh hơn DELETE, vì nó không ghi log cho mỗi dòng xóa và không kích hoạt các triggers. 
Lưu ý rằng TRUNCATE không thể rollback dữ liệu.

Vì vậy, lựa chọn giữa DELETE và TRUNCATE phụ thuộc vào yêu cầu cụ thể của bạn. 
Nếu bạn cần xóa dữ liệu dựa trên một điều kiện hoặc muốn ghi log cho mỗi dòng xóa, hãy sử dụng DELETE. 
Nhưng nếu bạn chỉ muốn xóa toàn bộ dữ liệu từ bảng mà không cần ghi log hoặc kích hoạt triggers, TRUNCATE có thể là lựa chọn tốt hơn về hiệu suất.