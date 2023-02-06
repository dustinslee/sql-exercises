use bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
LEFT JOIN categories ON products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
LEFT JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, s.EmployeeID, SUM(Quantity) sq
FROM sales s
INNER JOIN employees e ON e.EmployeeID = s.EmployeeID 
GROUP BY s.EmployeeID
ORDER BY SUM(Quantity) DESC;

SELECT MAX(s.a)
FROM (SELECT SUM(Quantity) a
FROM sales
GROUP BY EmployeeID) s
      
/* joins: find the name of the department, and the name of the category for Appliances and Games */

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
