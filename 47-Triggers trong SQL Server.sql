Trigger là gì ?
- Trigger là 1 đoạn thủ tục SQL được thực thi tự động khi 1 sự kiện cụ thể xảy ra trên 1 bảng (table) hoặc dạng xem(view)
   Insert
   Update 
   Delete
   DDL(Data Definition Language)
   DML(Data Manipulation Language)
- Trigger dc chia làm 2 loại chính:
   Trigger Before: Thực thi trước khi sự kiện xảy ra
   Trigger After: Thực thi sau khi sự kiện xảy ra
 * Syntax:
 CREATE TRIGGER trigger_name
 ON table_name
 FOR {INSERT | UPDATE | DELETE}
 AS
 BEGIN 
   -- Code thực thi xảy ra sự kiện
END;

-- Trigger khi insert sẽ chuyển productName về viết hoa toàn bộ:
CREATE TRIGGER MakeProductNameUpperCase
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i
	WHERE Products.ProductID = i.ProductID
END

INSERT [dbo].[Products]([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- Viết một trigger trong cơ sở dữ liệu Northwind để đảm bảo 
-- rằng mỗi khi có một chi tiết đơn hàng mới được thêm vào, số lượng tồn kho phải được giảm đi
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock] = [UnitsInStock]-(SELECT [Quantity] FROM inserted WHERE [dbo].[Products].ProductID = inserted.ProductID)
	WHERE [dbo].[Products].[ProductID] IN (SELECT [ProductID] FROM inserted)
END


INSERT INTO [dbo].[Order Details]([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
VALUES (10248, 78, 10, 50, 0);
