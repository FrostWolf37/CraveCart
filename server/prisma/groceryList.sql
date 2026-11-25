PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS reviews;

CREATE TABLE stock (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	category TEXT NOT NULL CHECK (category IN ('Fruits', 'Vegetables', 'Dairy', 'Bakery', 'Meat & Seafood', 'Beverages', 'Snacks')),
	quantity INTEGER NOT NULL CHECK (quantity >= 0),
	price FLOAT NOT NULL,
	image TEXT,
	alt TEXT NOT NULL
);

CREATE TABLE reviews (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	stockID INTEGER NOT NULL REFERENCES stock(id) ON DELETE CASCADE,
	rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5)
);

INSERT INTO stock (name, category, quantity, price, image, alt) VALUES
  ('Apples',                 'Fruits', 5, 1.99, 'images/apples.jpeg', 'A pile of apples' ),
  ('Bananas',                'Fruits', 7, 1.00, 'images/bananas.jpg', 'A bundle of bananas' ),
  ('Mangos',                 'Fruits', 12, 1.25, 'images/mangos.jpg', 'Two mangos and some sliced mango'  ),
  ('Strawberries',           'Fruits', 7, 2.69, 'images/strawberries.jpeg', 'A pile of strawberries' ),
  ('Grapes',                 'Fruits', 3, 1.99, 'images/grapes.jpg', 'A bundle of grapes' ),
  ('Broccoli',               'Vegetables', 7, 2.29, 'images/broccoli.jpg', 'Two pieces of broccoli' ),
  ('Celery',                 'Vegetables', 5, 1.00, 'images/celery.jpg', 'A stalk and a stem of celery' ),
  ('Carrots',                'Vegetables', 8, 2.19, 'images/carrots.jpg', 'A pile of carrots' ),
  ('Cucumbers',              'Vegetables', 12, 0.80, 'images/cucumbers.jpg', 'Two cucumbers and sliced cucumber' ),
  ('Cauliflower',           'Vegetables', 7, 2.99, 'images/cauliflower.jpg', 'A head of cauliflower' ),
  ('Milk',                  'Dairy', 10, 2.62, 'images/milk.jpg', 'A jug of milk' ),
  ('Yogurt',                'Dairy', 14, 2.99, 'images/yogurt.jpg', 'A container of yogurt' ),
  ('Cheese',                'Dairy', 8, 1.99, 'images/cheese.jpg', 'A package of cheese' ),
  ('Ice cream',             'Dairy', 10, 3.25, 'images/ice_cream.jpg', 'A container of ice cream' ),
  ('Cream cheese',          'Dairy', 8, 1.65, 'images/cream_cheese.jpg', 'A block of cream cheese' ),
  ('Cakes',                 'Bakery', 3, 4.35, 'images/cake.jpg', 'A cake in a plastic container' ),
  ('Cookies',               'Bakery', 7, 4.39, 'images/cookies.jpg', 'A pack of cookies' ),
  ('Bread',                 'Bakery', 10, 3.49, 'images/bread.jpg', 'A bag of bread' ),
  ('Pastries',              'Bakery', 5, 3.85, 'images/pastries.jpg', 'A package of croissants' ),
  ('Donuts',                'Bakery', 4, 3.75, 'images/donuts.jpg', 'A container full of donuts' ),
  ('Beef',                  'Meat & Seafood', 5, 5.99, 'images/beef.jpg', 'A package of ground beef' ),
  ('Pork',                  'Meat & Seafood', 7, 3.65, 'images/pork.jpg', 'A package of ground pork' ),
  ('Salmon',                'Meat & Seafood', 3, 9.00, 'images/salmon.jpg', 'A package of salmon' ),
  ('Cod',                   'Meat & Seafood', 5, 10.89, 'images/cod.jpg', 'A bag of cod' ),
  ('Haddock',               'Meat & Seafood', 10, 9.89, 'images/haddock.jpg', 'A bag of haddock' ),
  ('Water',                 'Beverages', 10, 3.55, 'images/water.jpg', 'A package of water bottles' ),
  ('Juice',                 'Beverages', 14, 2.45, 'images/juice.jpg', 'A large bottle of juice' ),
  ('Soda',                  'Beverages', 10, 1.00, 'images/soda.jpeg', 'A large bottle of cola' ),
  ('Coffee',                'Beverages', 8, 12.65, 'images/coffee.jpg', 'A container of coffee grounds' ),
  ('Tea',                   'Beverages', 7, 1.00, 'images/tea.jpg', 'A bottle of tea' ),
  ('Crackers',              'Snacks', 8, 2.45, 'images/crackers.jpg', 'A box of crackers' ),
  ('Fruit snacks',          'Snacks', 12, 4.95, 'images/fruit_snacks.jpg', 'A box of fruit snacks' ),
  ('Popcorn',               'Snacks', 12, 4.95, 'images/popcorn.jpg', 'A box of popcorn bags' ),
  ('Chocolate pudding',     'Snacks', 16, 1.45, 'images/chocolate_pudding.jpg', 'A pack of chocolate pudding cups' ),
  ('Trail mix',             'Snacks', 8, 6.39, 'images/trail_mix.jpg', 'A bag of trail mix' );

INSERT INTO reviews (stockID, rating) VALUES
	(1, 5),
	(30, 2),
	(20, 3),
	(16, 3),
	(12, 2),
	(7, 4),
	(7, 5),
	(8, 5),
	(8, 3),
	(8, 3),
	(8, 2),
	(2, 4),
	(8, 5),
	(1, 1),
	(1, 1);
