USE uber_analysis;
SHOW TABLES;
SELECT COUNT(*) FROM uber_data;
SELECT * FROM uber_data LIMIT 10;
SELECT `Time Slot`, COUNT(`Request id`) AS Total_Requests
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Total_Requests DESC;
SELECT `Time Slot`, `Status`, COUNT(`Request id`) AS Request_Count
FROM uber_data
GROUP BY `Time Slot`, `Status`
ORDER BY `Time Slot`, `Status`;

SELECT 
  `Time Slot`,
  COUNT(`Request id`) AS Total_Requests,
  SUM(CASE WHEN `Status` = 'Trip Completed' THEN 1 ELSE 0 END) AS Completed,
  SUM(CASE WHEN `Status` != 'Trip Completed' THEN 1 ELSE 0 END) AS Supply_Gap
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Supply_Gap DESC;

SELECT 
  `Time Slot`,
  SUM(CASE WHEN `Status` = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled,
  SUM(CASE WHEN `Status` = 'No Cars Available' THEN 1 ELSE 0 END) AS No_Cars
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Cancelled DESC;

SELECT 
  `Pickup point`, 
  `Status`, 
  COUNT(`Request id`) AS Request_Count
FROM uber_data
GROUP BY `Pickup point`, `Status`
ORDER BY `Pickup point`, Request_Count DESC;


SELECT `Hour`, COUNT(`Request id`) AS Total_Requests
FROM uber_data
GROUP BY `Hour`
ORDER BY `Hour`;


SELECT * FROM uber_data
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/uber_data_export.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT `Time Slot`, COUNT(*) AS Total_Requests
FROM uber_data
GROUP BY `Time Slot`;
SELECT `Status`, COUNT(`Request id`) AS Count
FROM uber_data
GROUP BY `Status`
ORDER BY Count DESC;

SELECT `Pickup point`, COUNT(`Request id`) AS Count
FROM uber_data
GROUP BY `Pickup point`;

SELECT `Hour`, COUNT(`Request id`) AS Requests
FROM uber_data
GROUP BY `Hour`
ORDER BY `Hour`;

SELECT `Day`, COUNT(`Request id`) AS Requests
FROM uber_data
GROUP BY `Day`;

SELECT COUNT(*) AS No_Driver_Assigned
FROM uber_data
WHERE `Driver id` IS NULL;

SELECT COUNT(*) AS No_Drop_Recorded
FROM uber_data
WHERE `Drop timestamp` IS NULL;

SELECT COUNT(*) AS Total_Requests FROM uber_data;


SELECT `Time Slot`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Time Slot`, `Status`
ORDER BY `Time Slot`;

SELECT `Pickup point`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Pickup point`, `Status`;

SELECT `Hour`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Hour`, `Status`
ORDER BY `Hour`;

SELECT `Day`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Day`, `Status`;

SELECT `Pickup point`, `Time Slot`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Pickup point`, `Time Slot`;

SELECT `Time Slot`, 
       SUM(CASE WHEN `Status` = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled,
       SUM(CASE WHEN `Status` = 'No Cars Available' THEN 1 ELSE 0 END) AS No_Cars
FROM uber_data
GROUP BY `Time Slot`;

SELECT `Hour`, COUNT(*) AS Completed
FROM uber_data
WHERE `Status` = 'Trip Completed'
GROUP BY `Hour`
ORDER BY `Hour`;

SELECT `Hour`, COUNT(*) AS Requests
FROM uber_data
GROUP BY `Hour`
ORDER BY `Hour`;

SELECT `Time Slot`, `Pickup point`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Time Slot`, `Pickup point`, `Status`;

SELECT `Hour`, `Day`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Hour`, `Day`, `Status`;

SELECT `Pickup point`, `Status`, COUNT(*) AS Count
FROM uber_data
GROUP BY `Pickup point`, `Status`;

SELECT `Time Slot`, 
       COUNT(*) AS Total,
       SUM(CASE WHEN `Status` = 'Trip Completed' THEN 1 ELSE 0 END) AS Completed,
       SUM(CASE WHEN `Status` != 'Trip Completed' THEN 1 ELSE 0 END) AS Failed
FROM uber_data
GROUP BY `Time Slot`;