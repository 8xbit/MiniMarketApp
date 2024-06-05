USE mini_market_app_db;
-- Create Users
CREATE USER 'admin'@'%' IDENTIFIED BY '0000';
CREATE USER 'sotock_manager'@'%' IDENTIFIED BY '0000';
CREATE USER 'cashier'@'%' IDENTIFIED BY '0000';
CREATE USER 'client'@'%' IDENTIFIED BY '0000';

-- to be added in the future
CREATE USER 'cleaner'@'%' IDENTIFIED BY '0000';
CREATE USER 'security'@'%' IDENTIFIED BY '0000';

-- Grant Permissions
-- admin
GRANT ALL PRIVILEGES ON mini_market_app_db.* TO 'admin'@'%';
-- stock manager 
GRANT SELECT, INSERT, UPDATE, DELETE ON mini_market_app_db.Product TO 'sotock_manager'@'%';
-- cashier
GRANT SELECT, INSERT, UPDATE ON mini_market_app_db.Product TO 'cashier'@'%';
GRANT SELECT, INSERT ON mini_market_app_db.Bill TO 'cashier'@'%';
-- client
GRANT SELECT ON mini_market_app_db.Product TO 'client'@'%';
GRANT SELECT ON mini_market_app_db.Bill TO 'client'@'%';
