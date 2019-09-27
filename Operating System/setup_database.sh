

mysql -u myuserid -p'1q2w3e!Q' <<QUERY
DROP DATABASE IF EXISTS mydb ;
CREATE DATABASE mydb;
use mydb;

CREATE TABLE IF NOT EXISTS CardSlide (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(6) CHARACTER SET utf8 NOT NULL,
  tag VARCHAR(100) CHARACTER SET utf8 NOT NULL,
  tagColor VARCHAR(7) CHARACTER SET utf8 NOT NULL,
  title VARCHAR(100) CHARACTER SET utf8 NOT NULL,
  article VARCHAR(500) CHARACTER SET utf8 NOT NULL,
  linkTitle VARCHAR(100) CHARACTER SET utf8 NOT NULL,
  link VARCHAR(22) CHARACTER SET utf8 NOT NULL,
  imageURL VARCHAR(300) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE IF NOT EXISTS MiniCarousel (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  link VARCHAR(500) NOT NULL,
  imageURL VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cards (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(6) CHARACTER SET utf8 NOT NULL,
  imageURL VARCHAR(300) CHARACTER SET utf8 NOT NULL,
  gradient VARCHAR(106) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE IF NOT EXISTS Users (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(20) CHARACTER SET utf8 NOT NULL,
  password VARCHAR(20) CHARACTER SET utf8 NOT NULL,
  is_superuser TINYINT(1) DEFAULT false NOT NULL
);

INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("ship","FAST, FREE DELIVERY","#00A8E1","Fast, FREE delivery on over 100 million items","Super-fast delivery, tens of millions of items, and flexible delivery options to fit your life. Plus, Prime members get FREE One-Day Delivery on tens of millions of items.","Explore Prime Delivery","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_A01._CB514650866_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("ship","SAME-DAY DELIVERY","#00A8E1","FREE Same-Day Delivery","Prime members get FREE Same-Day Delivery on over three million items with qualifying orders.","Explore Same-Day Delivery","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_A02._CB514650866_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("ship","RELEASE DAY DELIVERY","#00A8E1","Skip the lines and get it on release day","No more waiting in line! Choose Free Release-Date Delivery at checkout on qualified items, and your package will be delivered on the release day by 7pm.","Explore Release-Date Delivery","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_A03._CB514650829_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("ship","PRIME NOW","#00A8E1","Ultrafast delivery on thousands of items","Prime Now offers household items and essentials you need everyday plus the best of Amazon, delivered to your doorstep. Choose 2-hour delivery or 1-hour delivery in select cities.","Explore Prime Now","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_A04._CB494909365_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("stream","PRIME VIDEO","#FF6138","Watch movies, TV, live events, and more","As a Prime member, you can watch exclusive Amazon Originals and thousands of popular movies and TV shows—all at no extra cost. Watch at home or on the go with practically any device.","Explore Prime Video","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_B01._CB457663232_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("stream","TWITCH PRIME","#FF6138","Free Games & Loot with Twitch Prime","Gamers can get free games, in-game items, a free Twitch channel subscription every month and more with Twitch Prime.","Explore Twitch Prime","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_B02._CB513839286_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("stream","PRIME MUSIC","#FF6138","Millions of songs for every moment","As a Prime member, you can stream over 2 million songs ad free, listen on any Echo device, and take your music anywhere with offline listening.","Explore Prime Music","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_B03._CB513839286_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("stream","AMAZON ORIGINALS","#FF6138","Enjoy Amazon Original series and more","Watch award-winning Amazon Originals like The Marvelous Mrs. Maisel, as well as exclusive series available only with Prime, including Goliath, Sneaky Pete, and The Grand Tour.","Explore Amazon Originals","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/digital/video/merch/2018/Other/AVD12272_PrimeContentUpdate/Card_B04_AVD12272_PrimeContentUpdate_1280x400_en_US._CB474157036_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("stream","AUDIBLE CHANNELS","#FF6138","Original audio programs for life on the go","Audible Channels are free with your Prime membership. Enjoy original audio series and playlists handcrafted for every interest. Just download the Audible app and start listening.","Explore Audible Channels","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_B05._CB514650828_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("shop","PRIME AT WHOLE FOODS MARKET","#E31F64","Our healthiest benefit yet","Exclusive savings for Prime members in all US stores, 5% Back for eligible Prime members with the Amazon Prime Rewards Visa Card, and 2-hour delivery with Prime Now in select cities (more soon)","Explore Prime at Whole Foods","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_C06._CB495022579_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("shop","ALEXA VOICE SHOPPING","#E31F64","The simplest way to shop. Just ask Alexa.","With Alexa, shopping for essentials and reordering your favorite items from Amazon has never been easier.","Learn more about Alexa and Prime","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_C01_revised._CB502880131_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("shop","JUST WITH PRIME","#E31F64","Exclusive brands and deals available only to Prime members","As a Prime member enjoy early access to deals, Prime exclusive brands, and savings.","Shop Prime Member Exclusives","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_C03._CB511882458_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("shop","AMAZON FAMILY","#E31F64","Save on supplies for the family","Prime members save 20% off both diapers and baby food when they have 5 or more subscriptions arriving","Explore Family Supplies","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_C04._CB514650828_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("read","PRIME READING","#36C2B4","Prime members read free","As a Prime member, you can now read as much as you like from over a thousand top Kindle books, magazines, short works, books with Audible narration, comics, children's books and more—all at no additional cost.","Explore Prime Reading","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_D01._CB514706473_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("read","AMAZON FIRST READS","#36C2B4","Read next month's new releases today","Each month, Prime members can download one editors' pick for free--before the official publication date. Downloaded titles are yours to keep.","Learn more about Amazon First Reads","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_D02._CB513839283_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("more","5% BACK","#FFC400","Earn more with Prime Rewards","Eligible Prime members can earn 5% back at Amazon.com using the Amazon Prime Rewards Visa Card or the Amazon Prime Store card. All Prime members earn 2% rewards with Amazon Prime Reload.","Learn more about Prime Rewards","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_E03._CB513839888_.jpg");
INSERT INTO CardSlide (category,tag,tagColor,title,article,linkTitle,link,imageURL) VALUES ("more","AMAZON PHOTOS","#FFC400","Unlimited, free photo storage","Back up and share your photos with unlimited photo storage. Add your photos to the free app to see them on all your devices.","Explore Amazon Photos","https://www.amazon.com","https://images-na.ssl-images-amazon.com/images/G/01/marketing/prime/detail_page/Card_E01._CB513839282_.jpg");


INSERT INTO MiniCarousel (link,imageURL) VALUES ("https://www.amazon.com/gp/product/B07FNZ35DV/ref=prime_bnft_scrl_asin","minicarousel/81WN._CB481226577_.jpg");
INSERT INTO MiniCarousel (link,imageURL) VALUES ("https://www.amazon.com/gp/product/B07FDKRJQC/ref=prime_bnft_scrl_asin","minicarousel/91yXd._CB482706877_.jpg");
INSERT INTO MiniCarousel (link,imageURL) VALUES ("https://www.amazon.com/gp/product/B07G9LGZCM/ref=prime_bnft_scrl_asin","minicarousel/9159TQ-lLuL._CB461046093_.jpg");
INSERT INTO MiniCarousel (link,imageURL) VALUES ("https://www.amazon.com/gp/product/B073RQKC9N/ref=prime_bnft_scrl_asin","minicarousel/91GWBxUa._CB482706877_.jpg");

INSERT INTO Cards (category,imageURL,gradient) VALUES ("ship","cards/ship.png","30deg, #2C88AE 40%, #00A8E1 90%, #00A8E1 48px");
INSERT INTO Cards (category,imageURL,gradient) VALUES ("stream","cards/stream.png","30deg, #cc0c39 40%, #ff6138 90%, #ff6138 74px");
INSERT INTO Cards (category,imageURL,gradient) VALUES ("shop","cards/shop.png","30deg, #a90067 40%, #e31f64 90%, #e31f64 74px");
INSERT INTO Cards (category,imageURL,gradient) VALUES ("read","cards/read.png","30deg, #008577 40%, #36c2b4 90%, #36c2b4 74px");
INSERT INTO Cards (category,imageURL,gradient) VALUES ("more","cards/more.png","30deg, #ff6138 40%, #ffc400 90%, #ffc400 74px");

INSERT INTO Users (username, password, is_superuser) values ('admin', '1234',true);
QUERY
exit
