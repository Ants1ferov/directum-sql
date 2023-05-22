drop table if exists Arrivals
go

drop table if exists Sales
go

drop table if exists Products
go

drop table if exists Sellers
go

create table Sellers
(
	ID uniqueidentifier NOT NULL DEFAULT newid(),
	Surname nvarchar(200),
	Name nvarchar(200),
	CONSTRAINT PR_Sellers PRIMARY KEY (ID)
)
go

create table Products
(
	ID uniqueidentifier NOT NULL DEFAULT newid(),
	Name nvarchar(200),
	Price decimal(5,2),
	CONSTRAINT PR_Products PRIMARY KEY (ID)
)
go

create table Sales
(
	ID uniqueidentifier NOT NULL DEFAULT newid(),
	IDSel uniqueidentifier,
	IDProd uniqueidentifier,
	Date date,
	Quantity decimal(5,2),
	CONSTRAINT PR_Sales PRIMARY KEY (ID),
	CONSTRAINT FK_Sales_Sellers FOREIGN KEY (IDSel) REFERENCES Sellers(ID),
	CONSTRAINT FK_Sales_Products FOREIGN KEY (IDProd) REFERENCES Products(ID)
)
go

create table Arrivals
(
	ID uniqueidentifier NOT NULL DEFAULT newid(),
	IDProd uniqueidentifier,
	Date date,
	Quantity decimal(5,2),
	CONSTRAINT PR_Arrivals PRIMARY KEY (ID),
	CONSTRAINT FK_Arrivals_Products FOREIGN KEY (IDProd) REFERENCES Products(ID)
)
go

insert into Sellers (ID, Surname, Name)
values
('47CA433D-C905-4324-B285-B2473DB1FB08', '���������','����'),
('2BD6C512-3AEF-4794-B76E-C4CAB8CE778E', '�������','�����'),
('79957DB9-D4E2-45B2-A006-2C0799069A29', '������','������'),
('97BCB1F9-F283-4055-A9F6-ED97FC66917C', '�����','������'),
('6852C7D3-1A0E-4B3F-80C9-5E357784AA0E', '��������','�����')

insert into Products (ID, Name, Price)
values
('DC334048-0B41-4B25-9A96-3FB94A9DEDBA', '������', 39.5),
('88A58793-701A-41A3-B1FB-3495E2D1ED1C', '������', 60.99),
('0D003B51-4410-474E-8A99-A9BE469253FA', '����', 35),
('033B0859-C448-4860-BA8A-630241FD7709', '��������', 99.9),
('CEF16318-A594-4346-8FEE-6602575E82F7', '�����', 149.9),
('FF644D55-9467-44F0-A11F-0112550D1625', '�����', 76.21),
('40C56912-4519-4129-BAAB-655FC6973036', '�������� ���', 178.99)

insert into Arrivals (IDProd, Date, Quantity)
values
('88A58793-701A-41A3-B1FB-3495E2D1ED1C', '12.09.2013', 25),
('DC334048-0B41-4B25-9A96-3FB94A9DEDBA', '11.09.2013', 40),
('033B0859-C448-4860-BA8A-630241FD7709', '12.09.2013', 30),
('0D003B51-4410-474E-8A99-A9BE469253FA', '10.09.2013', 50),
('0D003B51-4410-474E-8A99-A9BE469253FA', '14.09.2013', 35),
('0D003B51-4410-474E-8A99-A9BE469253FA', '17.09.2013', 70),
('CEF16318-A594-4346-8FEE-6602575E82F7', '13.09.2013', 38),
('88A58793-701A-41A3-B1FB-3495E2D1ED1C', '16.09.2013', 40),
('DC334048-0B41-4B25-9A96-3FB94A9DEDBA', '13.09.2013', 50),
('033B0859-C448-4860-BA8A-630241FD7709', '16.09.2013', 60),
('CEF16318-A594-4346-8FEE-6602575E82F7', '17.09.2013', 100),
('40C56912-4519-4129-BAAB-655FC6973036', '13.09.2013', 84),
('FF644D55-9467-44F0-A11F-0112550D1625', '24.09.2013', 249),
('FF644D55-9467-44F0-A11F-0112550D1625', '11.09.2013', 102),
('40C56912-4519-4129-BAAB-655FC6973036', '01.10.2013', 95)

insert into Sales (IDSel, IDProd, Date, Quantity)
values
('79957DB9-D4E2-45B2-A006-2C0799069A29', '0D003B51-4410-474E-8A99-A9BE469253FA', '01.10.2013', 5),
('79957DB9-D4E2-45B2-A006-2C0799069A29', '88A58793-701A-41A3-B1FB-3495E2D1ED1C', '01.10.2013', 6),
('6852C7D3-1A0E-4B3F-80C9-5E357784AA0E', '40C56912-4519-4129-BAAB-655FC6973036', '03.10.2013', 2),
('6852C7D3-1A0E-4B3F-80C9-5E357784AA0E', 'FF644D55-9467-44F0-A11F-0112550D1625', '04.10.2013', 7),
('47CA433D-C905-4324-B285-B2473DB1FB08', '033B0859-C448-4860-BA8A-630241FD7709', '08.10.2013', 4),
('47CA433D-C905-4324-B285-B2473DB1FB08', 'CEF16318-A594-4346-8FEE-6602575E82F7', '02.10.2013', 21),
('97BCB1F9-F283-4055-A9F6-ED97FC66917C', '88A58793-701A-41A3-B1FB-3495E2D1ED1C', '06.10.2013', 30),
('6852C7D3-1A0E-4B3F-80C9-5E357784AA0E', 'DC334048-0B41-4B25-9A96-3FB94A9DEDBA', '10.10.2013', 17)