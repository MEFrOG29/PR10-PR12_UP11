CREATE VIEW current_year_orders AS
	SELECT id_order,
    order_date,
    orders.id_customer,
    login,
    second_name,
    first_name
    FROM market.orders 
    JOIN market.customers ON market.orders.id_customer = market.customers.id_customer
    WHERE YEAR(order_date) = YEAR(CURRENT_DATE());
    
CREATE VIEW book_info AS
	SELECT id_book,
    second_name,
    first_name,
    title,
    price
    FROM market.books
    JOIN market.authors ON market.books.id_author = market.authors.id_author;
    
CREATE VIEW author_books AS
	SELECT second_name,
    first_name,
    GROUP_CONCAT(DISTINCT title SEPARATOR '; ') AS books
    FROM market.authors
    JOIN market.books ON market.authors.id_author = market.books.id_author
    GROUP BY second_name, first_name;
    
CREATE VIEW like_fairy_tale AS
	SELECT id_book,
    second_name,
    first_name,
    title,
CASE 
	WHEN title LIKE '%Сказки%'
		THEN 'Да'
	ELSE 'Нет'
END AS fairy_tale,
    price
    FROM book_info;
    
CREATE VIEW price_category AS
	SELECT id_book,
    second_name,
    first_name,
    title,
CASE 
	WHEN price < 1000
		THEN 'Дешевая'
	WHEN price < 5000
		THEN 'Средняя'
	ELSE 'Дорогая'
END AS category,
    price
    FROM book_info;
    
    DROP VIEW author_books
    
    