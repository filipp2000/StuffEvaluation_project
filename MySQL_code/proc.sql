DELIMITER $
DROP PROCEDURE IF EXISTS company_upd$
CREATE PROCEDURE company_upd(IN user_name VARCHAR(12), IN _phone bigint, IN _street varchar(15), IN _num tinyint, IN _city varchar(15), IN _country varchar(15) )							    		
BEGIN 
    UPDATE company
    SET phone = _phone, street = _street, num = _num, city = _city, country = _country
    WHERE AFM = (select firm from manager where managerUsername = user_name);
END$
delimiter ;