CREATE TABLE links(
   link_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   link_adr TEXT NOT NULL,
   link_name VARCHAR(50) NOT NULL,
   link_click INT DEFAULT 1,
   user_name VARCHAR(50)  NOT NULL,
   CONSTRAINT fk_user FOREIGN KEY (user_name) REFERENCES users(user_name) ON UPDATE CASCADE
);
--A chinga, mi plan funcionó (- 3 -)

INSERT INTO users (user_name, user_pswrd) VALUES 
    ('Messi', '10WhatIsPassword'), 
    ('Carlos', '55NotaSafePassowrd'); --populating, populating

--For XML
CREATE TABLE xml_storage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255),
    xml_content LONGTEXT -- Use LONGTEXT if the XML is large
);

----------------------------------------------------------------------------------------------------------
--T-SQL, TMA3a
INSERT INTO [dbo].[Canvas_Imgs] (Name, Img, Caption)
VALUES 
('frtulla', '/shared/frtulla.jpg', 'Red fruits in a bush'),
('redCar', '/shared/redCar.jpg', 'Image of a red car'),
('sourPatch', '/shared/sourPatch.jpg', 'Picture of bags of SourPatch'),
('grayScale', '/shared/grayScale.jpg', 'Chess themed picture'),
('cup', '/shared/cup.jpg', 'Calyx surrounded by red rose petals'),
('apples', '/shared/apples.jpg', 'Picture of three apples'),
('odd', '/shared/odd.jpg', 'Picture in a psychedelic ambience'),
('juice', '/shared/juice.jpg', 'Ice-tea in a glass decorated by a lemon slice'),
('vamp1', '/shared/vamp1.jpg', 'Picture showcasing a volume of a novel surrounded by rose petals'),
('lily', '/shared/lily.jpg', 'Field of flower buds')
('neon', '/shared/neon.jpg', 'Neon sign to a Chinese restaurant in a dark alley'),
('build', '/shared/build.jpg', 'Picture of a church in a mysterious ambience'),
('brut', '/shared/brut.jpg', 'Grayscale image of a brutalist building'),
('maison', '/shared/maison.jpg', 'Picture showcasing two mason jars'),
('anx', '/shared/anx.jpg', 'Composition conveying the feeling of anxiety'),
('flaque', '/shared/flaque.jpg', 'Puddle of water after a rainy day, grayscale'),
('moon', '/shared/moon.jpg', 'Picture of the moon, surrounded by tree branches, in a clear night'),
('cup2', '/shared/cup2.jpg', 'Spilled calyx, scattering rose petals'),
('eng', '/shared/eng.jpg', 'Photo of the reflection of an angel statue, grayscale'),
('mint', '/shared/mint.jpg', 'Image of a shrub, close-up view'); --Strongly hatting on the red from T for inputs
