create database ecosmetic_store;
use ecosmetic_store;


    create table users(
     user_id int primary key auto_increment,
      first_name varchar(50),
      last_name varchar(50),
     password varchar(50),
      role varchar(50),
      email varchar(50),
     phone varchar(50),
     address varchar(200),
      city varchar(50),
     zip INT,
     state varchar(50)
     );


create table state_tax(
     state_name varchar(100) primary key,
     sales_tax_rate double(9,2)
     );

 create table  shipping_details
     (shipping_type varchar(100) primary key,
     delivery_days int,
     shipping_charges double(9,2)
    );

create table catagory(
cat_id int primary key,
cat_name varchar(255));


create table products(
product_id int primary key auto_increment,
product_name varchar(255),
brand varchar(255),
product_rate double(9,2),
product_desc varchar(255),
weight decimal,
cat_id int,
constraint fk_catid foreign key(cat_id) references catagory(cat_id) on delete cascade on update cascade,
sub_catagory varchar(255));


create table order_details(
order_id int primary key auto_increment,
user_id int,
constraint fk_uid foreign key(user_id) references users(user_id) on delete cascade on update cascade,
product_id,
constraint fk_pid foreign key(product_id) references products(product_id) on delete cascade on update cascade,
receiver_name varchar(255),
receiver_address varchar(255),
receiver_city varchar(255),
receiver_zip INT,
receiver_state varchar(255),
constraint fk_rstate foreign key(receiver_state) references state_tax(state_name) on delete cascade on update cascade,
shipping_type varchar(255),
constraint fk_stype foreign key(shipping_type) references shipping_details(shipping_type)  on delete cascade on update cascade, 
order_date Date);


create table cart(
cart_id int primary key auto_increment,
product_id int,
constraint fk_pid foreign key(product_id) references products(product_id) on delete cascade on update cascade,
price double(9,2),
date Date,
user_id int,
constraint fk_userid foreign key(user_id) references users(user_id) on delete cascade on update cascade,
qty int);


create table payment_details(
payment_id int primary key,
username varchar(255),
card_number varchar(255),
card_type varchar(255),
cvv_no int,
expiry_date Date,
user_id int,
constraint fk_user_id foreign key(user_id) references users(user_id) on delete cascade on update cascade);


create table bill(
bill_no int primary key auto_increment,
order_id int,
constraint fk_oid foreign key(order_id) references order_details(order_id) on delete cascade on update cascade,
user_id int,
constraint fk_u_id foreign key(user_id) references users(user_id) on delete cascade on update cascade
);