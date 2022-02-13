USE Spray_Traceability;

create user BigBoss identified by 'boss';

grant all on Spray_Traceability to BigBoss with grant option;

create user storesperson identified by 'stores';

grant select on Spray_Traceability.* to storesperson;

grant update on chemical to storesperson; 
grant update on farmer to storesperson;
grant update on sprayorder to storesperson;  

show grants for BigBoss;
show grants for storesperson;

-- find the brands of chemical/spray that had premium price per litre
SELECT * FROM PREMIUMPRICE
where costLitre > 30;


-- Return a lsit for the usgae of paticular chemical for a farmer. Usefull for seeing who is buying what
select * from BRAND_USAGE_by_FARMER 
ORDER BY Last_Name, First_Name;

-- Returns the names of farmers that use more than 30 litres of weedblaster after start of 2020, usefull for restrictions on ammount of chemical used in a year to one customer        

select * from BRAND_USAGE_by_FARMER 
where orderVol>'30' and nameChem = 'weedBlaster' and orderDate >= '2020-01-01'
ORDER BY Last_Name, First_Name;


-- Returns list of farmers in Waterford, usfull for area sales personel  

SELECT * FROM countyUsageWat;

-- Returns list of farmers in Cork , usefull for area sales personel

SELECT * FROM countyUsageCork;

-- Retruns the numeber of farmers that have created orders for the brand Roundup, usefull for checking popularity

SELECT count(farmerID) as 'Number of Farmers'
FROM SPRAYORDER 
WHERE nameChem =
	(SELECT nameChem
    FROM CHEMICAL
	WHERE nameChem = 'Roundup');
    
-- Retrurnns who has ordered from start of 2020, usfull for christmass card list and free calendar.    
    
SELECT concat(fName, ' ', lName) as Customer_Name
FROM FARMER 
where farmerID in 
	(SELECT farmerID and orderDate >= '2020-01-01'
     FROM SPRAYORDER);
     
 -- For chececking anmount of chemicaal brands in stock.     
     
 select COUNT(nameChem) 
 from Chemical;
 
 
 
 
 

 
 

 
     



