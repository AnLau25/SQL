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
    ('Raphinha', '11isfunnyILike'),
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

INSERT INTO [dbo].[Comps] (Id, Name, type, Descript, Price)
VALUES 
(1, '8GB DDR4', 'RAM', 'Standard memory for light multitasking and everyday computing.', 40.00),
(2, '16GB DDR4', 'RAM', 'Good for gaming, programming, and professional workloads.', 50.00),
(3, '32GB DDR4', 'RAM', 'Ideal for heavy multitasking, video editing, and high-performance computing.', 120.00),
(4, '16GB LPDDR5', 'RAM', 'Power-efficient, high-speed memory for ultrabooks and mobile devices.', 130.00),
(5, '32GB LPDDR5', 'RAM', 'High-performance, low-power RAM suited for demanding applications on portable devices.', 250.00),

(6, '256GB SSD', 'Hard Drive', 'Fast storage for essential applications and files.', 30.00),
(7, '512GB SSD', 'Hard Drive', 'Balanced speed and capacity for most users.', 75.00),
(8, '1TB PCIe SSD', 'Hard Drive', 'High-speed storage ideal for large files and gaming.', 70.00),
(9, '2TB HDD', 'Hard Drive', 'Large-capacity traditional hard drive for mass storage.', 55.00),
(10, '4TB PCIe SSD', 'Hard Drive', 'Ultra-fast, high-capacity storage for professionals and gamers.', 240.00),

(11, 'Intel Core i5-1235U', 'CPU', 'Efficient 10-core CPU for everyday tasks and light productivity.', 250.00),
(12, 'Intel Core i7-1360P', 'CPU', 'High-performance 12-core processor for multitasking and creative work.', 400.00),
(13, 'AMD Ryzen 5 5625U', 'CPU', '6-core, power-efficient CPU for smooth performance in daily use.', 200.00),
(14, 'AMD Ryzen 9 7945HX', 'CPU', 'High-end 16-core processor for gaming and intensive workloads.', 700.00),
(15, 'Apple M2 Chip', 'CPU', 'ARM-based processor optimized for power efficiency and macOS performance.', 250.00),

(16, '13.6" Liquid Retina Display (2560x1664)', 'Display', 'Vivid colors and sharp visuals, ideal for MacBooks.', 300.00),
(17, '14" WUXGA (1920x1200) IPS with Anti-Glare', 'Display', 'Crisp resolution with wide viewing angles, great for productivity.', 150.00),
(18, '15.6" FHD (1920x1080) Anti-Glare LED-backlit', 'Display', 'Standard laptop display with good clarity and reduced glare.', 100.00),
(19, '17.3" QHD (2560x1440), 165Hz Refresh Rate', 'Display', 'High-refresh-rate screen for gaming and smooth visuals.', 350.00),
(20, '14" UHD (3840x2160) OLED', 'Display', 'Ultra-high resolution with deep blacks and vibrant colors.', 450.00),

(21, 'Realtek HD Audio', 'Sound Card', 'Standard integrated audio solution for most PCs.', 15.00),
(22, 'Dolby Atmos Speaker System', 'Sound Card', 'Surround sound experience with enhanced spatial audio.', 50.00),
(23, 'ESS Sabre Hi-Fi DAC', 'Sound Card', 'High-fidelity digital-to-analog converter for audiophiles.', 100.00),
(24, 'Integrated High-Fidelity Audio', 'Sound Card', 'Built-in premium sound solution for clear, rich audio.', 50.00),
(25, 'Creative Sound Blaster', 'Sound Card', 'Advanced sound processing with customizable audio enhancements.', 75.00);

INSERT INTO [dbo].[PCs] ([Id], [Name], [Descript], [Price], [BasePrice])
VALUES
(1, 'Dell Inspiron 15',
'So, you’re the type to buy a car just to get from point A to point B — the type who sees a computer as the mean to an end. If that’s you, we have exactly what you need. The Dell Inspiron is simple — no fancy, high-tech extras attached. It serves one purpose: Get. Things. Done. Whether it’s schoolwork or professional tasks, if you value practicality, this is the laptop for you. Specs: 8GB DDR4 RAM, 512GB SSD, Intel Core i5-1235U, 15.6" FHD Anti-Glare, Windows 11 Home, Realtek HD Audio.',
559.99, 89.99),

(2, 'Apple MacBook Air (M2)',
'You are a hipster, but not the "I want a frappapakeke" at Starbucks type. You are a traveler — the kind who enjoys the small things in life and knows the worth of handcrafted goods. Obviously, that includes coffee from lost to the crowds coffee shops and well-crafted computers. The MacBook Air might not be for everyone, but it is for you. It is lightweight, travel-sized, and packs definitely more power than it might appear at first glance. Specs: 16GB Unified Memory, 512GB SSD, Apple M2 Chip, 13.6" Liquid Retina, macOS Ventura, Integrated Hi-Fi Audio.',
1019.00, 94.00),

(3, 'Lenovo ThinkPad X1 Carbon Gen 11',
'People call you a workaholic, yet you only smirk in response, you know better. You are not a slave to your work — you are a productivity god. Thus, the only option befitting you is the Lenovo ThinkPad, a multitasking monster ready to tackle upcoming tasks and clear your calendar before the weekend. Specs: 32GB LPDDR5 RAM, 1TB PCIe SSD, Intel Core i7-1360P, 14" WUXGA IPS Anti-Glare, Windows 11 Pro, Dolby Atmos Speakers.',
1215.00, 295.00),

(4, 'HP Pavilion 14',
'Be real, it took you a week before you finally sat down to look for a new computer because you were too busy working on your ongoing projects. It’s okay, we get it — creativity waits for no one. That’s why you should be ready for action when the spark ignites with the HP Pavilion: compact, casual, and always ready for your next strike of genius. Specs: 8GB DDR4 RAM, 256GB SSD, AMD Ryzen 5 5625U, 14" FHD Micro-Edge IPS, Windows 11 Home, Realtek Audio.',
1099.99, 714.99),

(5, 'ASUS ROG Strix G17',
'If you made it all the way here after an hour of reading specs, go touch grass. Just kidding — but you clearly know your stuff, most likely because you''re a gamer, dedicated to finding the best setup to lead your team to victory or solo travel through dangerous lands. The ASUS ROG is the nat 20 to your boss fight — powerful, dynamic, and easy to tune. This computer is right up your Diagon Alley. Specs: 16GB DDR5 RAM, 4TB PCIe SSD, AMD Ryzen 9 7945HX, 17.3" QHD 165Hz, Windows 11 Home, ESS Sabre Hi-Fi DAC.',
1899.00, 459.00);

INSERT INTO [dbo].[Compat] ([Id], [PC_ID], [Comp_ID])
VALUES
(1, 1, 1), 
(2, 2, 5), 
(3, 2, 4), 
(4, 3, 5), 
(5, 3, 2), 
(6, 3, 3), 
(7, 3, 4), 
(8, 4, 1), 
(9, 5, 2), 
(10, 5, 3),

(11, 1, 6), 
(12, 1, 9),  
(13, 2, 7),  
(14, 3, 8),  
(15, 3, 7),  
(16, 3, 10), 
(17, 4, 6),  
(18, 4, 8),  
(19, 4, 9),  
(20, 5, 10), 
(21, 5, 8),  

(22, 1, 11), 
(23, 1, 13), 
(24, 2, 15), 
(25, 2, 12), 
(26, 3, 12),
(27, 3, 14), 
(28, 4, 13), 
(29, 4, 11), 
(30, 5, 14), 

(31, 1, 18), 
(32, 2, 16), 
(33, 3, 17),
(34, 3, 20), 
(35, 4, 18), 
(36, 5, 19), 

(37, 1, 24), 
(38, 2, 24), 
(39, 2, 22), 
(40, 3, 22), 
(41, 3, 24), 
(42, 4, 21), 
(43, 5, 23), 
(44, 5, 25); 

CREATE TABLE [dbo].[Users] (
    [Id]       INT           NOT NULL,
    [Name]     VARCHAR (50)  NOT NULL,
    [Password] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Comps]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Type] VARCHAR(50) NOT NULL, 
    [Descript] VARCHAR(MAX) NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL 
)


CREATE TABLE [dbo].[PCs]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Descript] VARCHAR(MAX) NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [BasePrice] DECIMAL(18, 2) NOT NULL
)

CREATE TABLE [dbo].[Compat]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [PC_ID] INT NOT NULL, 
	FOREIGN KEY (PC_ID) REFERENCES PCs (Id),
    [Comp_ID] INT NOT NULL,
	FOREIGN KEY (Comp_ID) REFERENCES Comps (Id)
)


CREATE TABLE [dbo].[Orders] (
    [Id]         INT             NOT NULL,
    [User_ID]    INT             NOT NULL,
    [PC_ID]      INT             NOT NULL,
    [CPU_ID]     INT             NOT NULL,
    [Display_ID] INT             NOT NULL,
    [HD_ID]      INT             NOT NULL,
    [RAM_ID]     INT             NOT NULL,
    [Sound_ID]   INT             NOT NULL,
    [Address]    VARCHAR (50)    NOT NULL,
    [CardNo]     DECIMAL (19)    NOT NULL,
    [Price]      DECIMAL (18, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([PC_ID]) REFERENCES [dbo].[PCs] ([Id]),
    FOREIGN KEY ([User_ID]) REFERENCES [dbo].[Users] ([Id])
);