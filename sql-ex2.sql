use bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(e.FirstName, ' ',e.LastName) AS 'Employee Name', SUM(s.Quantity) AS Total_Quantity_Sold
FROM sales AS s
INNER JOIN employees e ON e.EmployeeID = s.EmployeeID 
GROUP BY s.EmployeeID
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS 'Employee Name', SUM(Quantity) AS Total_Quantity_Sold
FROM sales s
INNER JOIN employees e ON e.EmployeeID = s.EmployeeID 
GROUP BY e.EmployeeID 
HAVING Total_Quantity_Sold = (SELECT SUM(Quantity) AS max 
				FROM sales 
				GROUP BY EmployeeID 
                ORDER BY max DESC LIMIT 1) 
ORDER BY Total_Quantity_Sold DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS 'Category Name', d.Name AS 'Department Name', c.DepartmentID
FROM categories AS c
INNER JOIN departments AS d ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California 
--You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS 'Total Quantity Sold', SUM(s.PricePerUnit*s.Quantity) AS 'Total Price Sold'
FROM sales AS s
INNER JOIN products AS p ON p.ProductID = s.ProductID
WHERE p.Name LIKE '%Hotel%California%'
GROUP BY s.productID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'Product Name', r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.NAME LIKE '%Visio%'
ORDER BY r.Rating ASC
LIMIT 1;
 
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT s.EmployeeID, e.FirstName, e.LastName, MAX(p.Name) AS 'Product Name', SUM(s.Quantity) AS 'Total_Sold'
FROM sales AS s
INNER JOIN employees AS e ON s.EmployeeID = e.EmployeeID
INNER JOIN products AS p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY Total_Sold DESC;