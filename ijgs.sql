CREATE TABLE links(
   link_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   link_adr TEXT NOT NULL,
   link_name VARCHAR(50) NOT NULL,
   link_click INT DEFAULT 1,
   user_name VARCHAR(50)  NOT NULL,
   CONSTRAINT fk_user FOREIGN KEY (user_name) REFERENCES users(user_name) ON UPDATE CASCADE
);
--A chinga, mi plan funcionó (- 3 -)