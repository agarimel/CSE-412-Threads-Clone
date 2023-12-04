BEGIN;

CREATE TABLE IF NOT EXISTS user_mgmt (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL, -- Increase the length to 50 characters
    email VARCHAR(50) NOT NULL,
    password VARCHAR(80) NOT NULL,
    image_file VARCHAR(20) NOT NULL,
    bg_file VARCHAR(20) NOT NULL,
    bio VARCHAR(200),
    date VARCHAR(20),
    bday VARCHAR(10),
    UNIQUE(username),
    UNIQUE(email)
);


CREATE TABLE IF NOT EXISTS post (
    id SERIAL PRIMARY KEY,
    tweet VARCHAR(500) NOT NULL,
    stamp VARCHAR(50) NOT NULL,
    post_img VARCHAR(20),
    user_id INTEGER REFERENCES user_mgmt(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS retweet (
    id SERIAL PRIMARY KEY,
    tweet_id INTEGER,
    user_id INTEGER REFERENCES user_mgmt(id) NOT NULL,
    retweet_stamp VARCHAR(50) NOT NULL,
    retweet_text VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS bookmark (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES post(id),
    user_id INTEGER REFERENCES user_mgmt(id)
);

CREATE TABLE IF NOT EXISTS timeline (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES post(id),
    retweet_id INTEGER REFERENCES retweet(id)
);
INSERT INTO user_mgmt VALUES (1, 'JaneDoe', 'test@test.com', 'sha256$S1k3Yhmm$a427c70b68a98a9d6de88fff58faff55fef44eaef298313b9200d68bcc191693', 'default.jpg', 'default_bg.jpg', NULL, 'October 2020', NULL);
INSERT INTO user_mgmt VALUES (2, 'SaumyaBhatt', 'saumya.bhatt106@gmail.com', 'sha256$KbvOaPRX$3d0e04d179e10176645a747c9a99f1e793d4116c356b59174d6f76a9c7cfd288', 'e41fbeccc6388b45.jpg', 'c4f4ba3cc4476efa.jpg', 'Electronics Engineer | BITS-Pilani, Goa Campus', 'October 2020', '2000-06-10');
INSERT INTO user_mgmt VALUES (3, 'CristianoRonaldo', 'cr7@portugal.com', 'sha256$QolA8QHN$220ddb3fd60c97337f2ea5e94834ac2a9c9b8b00a3e4aaf6a2bd52648103c4bc', '9ef20a2cdd877ec1.jpg', 'd7a9d58ca57c6fcc.jpg', 'Portugal | Juventus | 7 times Ballon D''Or winner', 'October 2020', '1985-02-05');
INSERT INTO user_mgmt VALUES (4, 'SebastianVettel', 'sebvettel@gmail.com', 'sha256$VMhR9Rdk$fc30c8eb0c41f2042d4104bf7319390a2b50d4f5521bdaf5b78990eae40a2cdd', '0d860a8857f9c1c9.jpg', 'd4479d95954da11a.jpg', '4 time Formula One Champion | Racer for Scuderia Ferrari | Father | Husband', 'October 2020', '1987-07-03');
INSERT INTO user_mgmt VALUES (5, 'SirRichardBranson', 'richardbranson@virgin.co.en', 'sha256$JSHaUBvu$a301c4090faaec74f1d872457252946a0261cfc785ca1f2aff7ec122d5545aa1', 'f56123b9bd005e12.jpg', 'd5464e7768bcba40.jpg', 'Founder of Virgin group of companies', 'October 2020', '1950-07-18');
INSERT INTO user_mgmt VALUES (6, 'LukaModric', 'lukamodric10@croatia.com', 'sha256$WTQLiTUX$66b993a25bb3a5b0836a908c648a78600fb95e667b2be308803d328c19be6f66', '84e7d873c6493ab1.jpg', '94b68f4d2401dd8d.jpg', 'Captain of Croatia Football National Team | Real Madrid | 2019 Ballon D''Or winner', 'October 2020', '1985-09-09');
INSERT INTO user_mgmt VALUES (7, 'LewisHamilton', 'lewis@hamilton.com', 'sha256$LwFIpuff$9ba2d5d33bd3854ddfe05817aad9dcbd05590dc077d9f399090a1574cd55abb9', '9126fa63c80a5781.jpg', '972d09923b509165.jpg', 'Constantly searching for my purpose, for adventure, open-mindedness and positivity ', 'October 2020', '1985-01-07');
INSERT INTO user_mgmt VALUES (8, 'BillGates', 'billgates@microsoft.com', 'sha256$z7VZ69Ip$8750f3df0c6a3452cddf3614fbfecc56f21d83a1f426aaecbd1f8aceeecc67c4', '004c8afa28951a33.jpg', 'e1ea845cb2dd64f6.jpg', 'Founder of Microsoft | President of Bill and Melinda Gates Foundation', 'October 2020', '1955-10-28');
INSERT INTO user_mgmt VALUES (9, 'FernandoAlonso', 'fernando_alonso@renault.com', 'sha256$JJMUVkee$f247c9f039166776a5aacb374ca23528aff9b0eb25ca1b5cc0e544667d845db4', '2c077d71c297cebd.jpg', 'd747c6a0b348d99f.jpg', 'World champion Karting . 2 times F1 World Champion . Winner 24h Le Mans . Winner 24h Daytona ', 'October 2020', '1981-07-29');
INSERT INTO user_mgmt VALUES (10, 'ChrisMartin', 'chrismartin@coldplay.com', 'sha256$SmTYUa9C$d9fd989bc0bd721a8f8d48be3b8540461d2752bba4fa1fe71be6dab1104f6741', 'e428f60f854f5241.jpg', '654c942280504ecd.jpg', 'Lead singer of a band called Coldplay', 'October 2020', '1977-03-02');
INSERT INTO user_mgmt VALUES (11, 'SherylSandberg', 'sherylsandberg@facebook.com', 'sha256$Aojqm8gj$997c85986f2e48b5e7be1e4edd2a8f38535dc040f297a35ea28478829d2f7cfe', '4218414f87ec2b43.jpg', 'd56bf390a11cedea.jpg', 'Facebook, mother of 2, friend to many great women', 'October 2020', '1969-08-28');

INSERT INTO post VALUES (1, 'Just finished setting up my twitter account. Stoked!', '28 October''20 11:47 PM', NULL, 2);
INSERT INTO post VALUES (2, 'Was a tough match today. But happy that we qualified for the semi-finals and for scoring a hattrick! Onwards we go!', '28 October''20 11:51 PM', NULL, 3);
INSERT INTO post VALUES (3, 'Am in love with this beast. From starting in the pitlane to P1!! Forza Ferrari!', '28 October''20 11:55 PM', 'd4b1d9b04f6efe74.jpg', 4);
INSERT INTO post VALUES (4, 'Am absolutely delighted to have completed the Trans-Pacific Crossing on the Virgin Sky Globe! What an experience. Got to learn so much! Simply marvelous!', '28 October''20 11:59 PM', NULL, 5);
INSERT INTO post VALUES (5, 'NINETY-TWO WINS!! Today is beyond my wildest dreams. I could not be here today without my team, continuously innovating and pushing the barrier in this game. I’m so grateful to have you guys by my side through this journey...', '29 October''20 12:13 AM', NULL, 7);
INSERT INTO post VALUES (6, 'It is inspiring to see so much passion these days for dealing with climate change and to know that the world has set some ambitious goals for solving it. What we need now are practical plans to reach those goals.', '29 October''20 12:15 AM', NULL, 8);
INSERT INTO post VALUES (7, 'Oprah Winfrey Live at Facebook at 1:30 PM PT.  Wish me luck as I attempt to interview the best interviewer ever!', '29 October''20 12:32 AM', NULL, 11);
INSERT INTO post VALUES (8, 'This car is absolutely amazing!!!!', '29 October''20 01:05 AM', '3630d80ca9f3cd80.png', 2);


INSERT INTO retweet VALUES (1, 2, 6, '29 October''20 12:02 AM', 'Congrats on the milestone brother! Looking forward to facing you in the semis!');
INSERT INTO retweet VALUES (2, 3, 9, '29 October''20 12:23 AM', 'Congrats for the win at Monaco! But keep a look in your rear mirror. Am right in the slipstream at Monza!');
INSERT INTO retweet VALUES (3, 5, 10, '29 October''20 12:26 AM', 'Well deserved brother! Such an inspiration you are!');
INSERT INTO retweet VALUES (4, 4, 2, '29 October''20 01:04 AM', 'Such a legend!');

INSERT INTO bookmark VALUES (1, 5, 2);
INSERT INTO bookmark VALUES (3, 6, 2);
INSERT INTO bookmark VALUES (4, 2, 2);
INSERT INTO bookmark VALUES (5, 3, 2);

INSERT INTO timeline VALUES (1, 1, NULL);
INSERT INTO timeline VALUES (2, 2, NULL);
INSERT INTO timeline VALUES (3, 3, NULL);
INSERT INTO timeline VALUES (4, 4, NULL);
INSERT INTO timeline VALUES (5, NULL, 1);
INSERT INTO timeline VALUES (6, 5, NULL);
INSERT INTO timeline VALUES (7, 6, NULL);
INSERT INTO timeline VALUES (8, NULL, 2);
INSERT INTO timeline VALUES (9, NULL, 3);
INSERT INTO timeline VALUES (10, 1, NULL); -- Change the post_id to an existing post id
INSERT INTO timeline VALUES (11, NULL, 4);
INSERT INTO timeline VALUES (12, 8, NULL);

COMMIT;

