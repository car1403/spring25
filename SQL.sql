DROP TABLE if exists adm;
DROP TABLE if exists cart;
DROP TABLE if exists cust;
DROP TABLE if exists item;
DROP TABLE if exists sales;
DROP TABLE if exists marker;

CREATE TABLE adm(
                    adm_id VARCHAR(20),
                    adm_pwd VARCHAR(20) NOT NULL,
                    adm_lev INT NOT NULL
);
ALTER TABLE adm ADD PRIMARY KEY(adm_id);
INSERT INTO adm VALUES ('admin01','pwd01',1);
INSERT INTO adm VALUES ('admin02','pwd02',2);
INSERT INTO adm VALUES ('admin03','pwd03',3);
SELECT * FROM adm;
CREATE TABLE cust(
                     cust_id VARCHAR(20),
                     cust_pwd VARCHAR(20) NOT NULL,
                     cust_name VARCHAR(30) NOT NULL
);
ALTER TABLE cust ADD PRIMARY KEY(cust_id);
INSERT INTO cust VALUES ('id01','pwd01','홍말숙');
INSERT INTO cust VALUES ('id02','pwd02','이말숙');
INSERT INTO cust VALUES ('id03','pwd03','정말숙');
SELECT * FROM cust;
-- item table
CREATE TABLE item(
                     item_id INT auto_increment primary key,
                     item_name VARCHAR(30) NOT NULL,
                     item_price INT NOT NULL,
                     item_imgname VARCHAR(40),
                     item_rdate datetime default CURRENT_TIMESTAMP -- ON UPDATE CURRENT_TIMESTAMP
);
ALTER TABLE item ADD CHECK (item_price > 0);

INSERT INTO item VALUES (null,'반바지',10000,'a.jpg',now());
INSERT INTO item VALUES (null,'반바지',20000,'b.jpg',now());
INSERT INTO item VALUES (null,'반팔',30000,'c.jpg',now());
INSERT INTO item VALUES (null,'긴팔',40000,'d.jpg',now());
SELECT * FROM item;

CREATE TABLE cart(
                     cust_id VARCHAR(20),
                     item_id INT,
                     cart_cnt INT,
                     cart_rdate datetime
);
ALTER TABLE cart ADD PRIMARY KEY(cust_id, item_id);
ALTER TABLE cart ADD FOREIGN KEY (cust_id) REFERENCES cust (cust_id);
ALTER TABLE cart ADD FOREIGN KEY (item_id) REFERENCES item (item_id);

select * from cart;
INSERT INTO cart VALUES ('id01','1',1,now())
    ON DUPLICATE KEY UPDATE
                         cart_cnt = cart_cnt + 1;

CREATE TABLE sales(
                      sales_id int auto_increment primary key,
                      sales_rdate DATE,
                      sales_price INT,
                      sales_gender CHAR(1)
);
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-01-02','%Y-%m-%d'), 100000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-01-02','%Y-%m-%d'), 200000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-02-02','%Y-%m-%d'), 300000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-02-02','%Y-%m-%d'), 400000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-03-02','%Y-%m-%d'), 450000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-03-02','%Y-%m-%d'), 780000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-04-02','%Y-%m-%d'), 500000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-04-02','%Y-%m-%d'), 330000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-05-02','%Y-%m-%d'), 670000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-05-02','%Y-%m-%d'), 220000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-06-02','%Y-%m-%d'), 880000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-06-02','%Y-%m-%d'), 120000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-07-02','%Y-%m-%d'), 300000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-07-02','%Y-%m-%d'), 220000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-08-02','%Y-%m-%d'), 490000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-08-02','%Y-%m-%d'), 480000, 'F');
SELECT * FROM sales;

CREATE TABLE marker(
                       marker_id INT auto_increment primary key,
                       marker_title VARCHAR(30),
                       marker_target VARCHAR(30),
                       maeker_lat FLOAT,
                       marker_lng FLOAT,
                       marker_img VARCHAR(30),
                       marker_loc CHAR(1)
);

INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 37.638446, 127.012702, 'kuk.jpg', 'S');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 37.638440, 127.011702, 'dak.jpg', 'S');
INSERT INTO marker VALUES (DROP TABLE if exists adm;
DROP TABLE if exists cart;
DROP TABLE if exists cust;
DROP TABLE if exists item;
DROP TABLE if exists sales;
DROP TABLE if exists marker;

CREATE TABLE adm(
                    adm_id VARCHAR(20),
                    adm_pwd VARCHAR(20) NOT NULL,
                    adm_lev INT NOT NULL
);
ALTER TABLE adm ADD PRIMARY KEY(adm_id);
INSERT INTO adm VALUES ('admin01','pwd01',1);
INSERT INTO adm VALUES ('admin02','pwd02',2);
INSERT INTO adm VALUES ('admin03','pwd03',3);
SELECT * FROM adm;
CREATE TABLE cust(
                     cust_id VARCHAR(20),
                     cust_pwd VARCHAR(20) NOT NULL,
                     cust_name VARCHAR(30) NOT NULL
);
ALTER TABLE cust ADD PRIMARY KEY(cust_id);
INSERT INTO cust VALUES ('id01','pwd01','홍말숙');
INSERT INTO cust VALUES ('id02','pwd02','이말숙');
INSERT INTO cust VALUES ('id03','pwd03','정말숙');
SELECT * FROM cust;
-- item table
CREATE TABLE item(
                     item_id INT auto_increment primary key,
                     item_name VARCHAR(30) NOT NULL,
                     item_price INT NOT NULL,
                     item_imgname VARCHAR(40),
                     item_rdate datetime default CURRENT_TIMESTAMP -- ON UPDATE CURRENT_TIMESTAMP
);
ALTER TABLE item ADD CHECK (item_price > 0);

INSERT INTO item VALUES (null,'반바지',10000,'a.jpg',now());
INSERT INTO item VALUES (null,'반바지',20000,'b.jpg',now());
INSERT INTO item VALUES (null,'반팔',30000,'c.jpg',now());
INSERT INTO item VALUES (null,'긴팔',40000,'d.jpg',now());
SELECT * FROM item;

CREATE TABLE cart(
                     cust_id VARCHAR(20),
                     item_id INT,
                     cart_cnt INT,
                     cart_rdate datetime
);
ALTER TABLE cart ADD PRIMARY KEY(cust_id, item_id);
ALTER TABLE cart ADD FOREIGN KEY (cust_id) REFERENCES cust (cust_id);
ALTER TABLE cart ADD FOREIGN KEY (item_id) REFERENCES item (item_id);

select * from cart;
INSERT INTO cart VALUES ('id01','1',1,now())
    ON DUPLICATE KEY UPDATE
                         cart_cnt = cart_cnt + 1;

CREATE TABLE sales(
                      sales_id int auto_increment primary key,
                      sales_rdate DATE,
                      sales_price INT,
                      sales_gender CHAR(1)
);
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-01-02','%Y-%m-%d'), 100000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-01-02','%Y-%m-%d'), 200000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-02-02','%Y-%m-%d'), 300000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-02-02','%Y-%m-%d'), 400000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-03-02','%Y-%m-%d'), 450000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-03-02','%Y-%m-%d'), 780000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-04-02','%Y-%m-%d'), 500000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-04-02','%Y-%m-%d'), 330000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-05-02','%Y-%m-%d'), 670000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-05-02','%Y-%m-%d'), 220000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-06-02','%Y-%m-%d'), 880000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-06-02','%Y-%m-%d'), 120000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-07-02','%Y-%m-%d'), 300000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-07-02','%Y-%m-%d'), 220000, 'F');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-08-02','%Y-%m-%d'), 490000, 'M');
INSERT INTO sales VALUES (null,STR_TO_DATE('2020-08-02','%Y-%m-%d'), 480000, 'F');
SELECT * FROM sales;

CREATE TABLE marker(
                       marker_id INT auto_increment primary key,
                       marker_title VARCHAR(30),
                       marker_target VARCHAR(30),
                       maeker_lat FLOAT,
                       marker_lng FLOAT,
                       marker_img VARCHAR(30),
                       marker_loc CHAR(1)
);

INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 37.638446, 127.012702, 'kuk.jpg', 'S');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 37.638440, 127.011702, 'dak.jpg', 'S');
INSERT INTO marker VALUES (null, '양꼬치집', 'http://www.google.com', 37.638346, 127.012602, 'yang.jpg', 'S');
INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 35.1796456, 129.0785432, 'kuk.jpg', 'B');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 35.1799456, 129.0785432, 'dak.jpg', 'B');
INSERT INTO marker VALUES (null, '양꼬치집', 'http://www.google.com', 35.1796456, 129.0637432, 'yang.jpg', 'B');
INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 33.4998002, 126.5352787, 'kuk.jpg', 'J');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 33.4997002, 126.5391787, 'dak.jpg', 'J');
INSERT INTO marker VALUES (null, '양꼬치집', 'http://www.google.com', 33.4996002, 126.5273787, 'yang.jpg', 'J');
SELECT * FROM marker;null, '양꼬치집', 'http://www.google.com', 37.638346, 127.012602, 'yang.jpg', 'S');
INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 35.1796456, 129.0785432, 'kuk.jpg', 'B');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 35.1799456, 129.0785432, 'dak.jpg', 'B');
INSERT INTO marker VALUES (null, '양꼬치집', 'http://www.google.com', 35.1796456, 129.0637432, 'yang.jpg', 'B');
INSERT INTO marker VALUES (null, '국밥집', 'http://www.naver.com', 33.4998002, 126.5352787, 'kuk.jpg', 'J');
INSERT INTO marker VALUES (null, '닭발집', 'http://www.daum.net', 33.4997002, 126.5391787, 'dak.jpg', 'J');
INSERT INTO marker VALUES (null, '양꼬치집', 'http://www.google.com', 33.4996002, 126.5273787, 'yang.jpg', 'J');
SELECT * FROM marker;

CREATE TABLE `board` (
                         `board_id` int NOT NULL AUTO_INCREMENT,
                         `board_title` varchar(100) DEFAULT NULL,
                         `board_content` varchar(300) DEFAULT NULL,
                         `board_author` varchar(30) DEFAULT NULL,
                         `board_hit` int DEFAULT '0',
                         `board_rdate` datetime DEFAULT CURRENT_TIMESTAMP,
                         `board_udate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci