USE track_lect2;

CREATE TABLE users(
    user_id INT PRIMARY KEY,
    login varchar(255),
    reg_dttm timestamp
);


CREATE TABLE payments(
	payment_id INT PRIMARY KEY,
    user_id INT,
    payment_sum double,
    payment_dttm TIMESTAMP,
    foreign key (user_id) REFERENCES users(user_id)
);


CREATE TABLE sessions(
	session_id INT PRIMARY KEY,
    user_id INT,
    begin_dttm TIMESTAMP,
    end_dttm TIMESTAMP default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- end_dttm - can't create without default...

LOAD DATA local INFILE '/home/roman/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


LOAD DATA local INFILE '/home/roman/sessions.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


LOAD DATA local INFILE '/home/roman/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
