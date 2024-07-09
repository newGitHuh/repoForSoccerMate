

create table Account(
accountID int ,
fullName char(30) ,--display name
username char(50) primary key,
[password] char(50),
email char(30),
phone char(10),
roleID int --1 for user 0 for admin?
)

create table Category(
productCategory char(30) primary key,
categoryName char(20)
)
insert into Category values ('Pants','pants')
insert into Category values ('Shirt','shirt')
  
create table product(
productID char(30) primary key,
productName char(30),
productDes char(200),
prices int,
productImage char(200),
productCategory char(30) foreign key references Category(productCategory) ON DELETE CASCADE,
isOnSale int ,--1 if onSale 0 if not
)
insert into product values (1,'Paris Saint-Germain','Nike Dri-FIT ADV technology combines moisture-wicking fabric with advanced engineering and features to help you stay dry and comfortable',120,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5faa6e3c-d726-4b8d-a547-fcb8811b459c/paris-saint-germain-2024-25-match-home-dri-fit-adv-football-shirt-t1CFRB.png','Shirt',0)
insert into product values (2,'Liverpool F.C','Nike Dri-FIT ADV technology combines moisture-wicking fabric with advanced engineering and features to help you stay dry and comfortable',100,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b4e36fa3-7a09-463d-ba35-0aff51968a97/liverpool-fc-2024-25-stadium-home-dri-fit-football-replica-shirt-dmlTgM.png','Shirt',0)
insert into product values (3,'FFF Mens Team','Nike Dri-FIT ADV technology combines moisture-wicking fabric with advanced engineering and features to help you stay dry and comfortable',110,'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/86087b33-bcf3-44c7-ad14-7f6d42aff283/fff-2024-25-match-home-dri-fit-adv-football-authentic-shirt-8SmhdW.png','Shirt',0)


create table feedBack(
feedBackID int,
productID char(30) foreign key references product(productID) ON DELETE CASCADE,
username char(50) foreign key references Account(username) ON DELETE CASCADE,
Comment char(100),
starVote int, --1 to 5
displayName char(25)
)

create table invoice(
invoiceID char(30) primary key,
username char(50) foreign key references Account(username) ON DELETE CASCADE,
ShippingAddress char(50),
phone int,
totalPrice int,
completeStatus char(10)
)

create table invoiceDetail(
invoiceID char(30) foreign key references invoice(invoiceID) ON DELETE CASCADE,
productID char(30) foreign key references product(productID) ON DELETE CASCADE,
quantity int,
totalPrice int
)



