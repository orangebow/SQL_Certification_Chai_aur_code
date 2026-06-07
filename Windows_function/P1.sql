Bank Passbook Initial balance: 0
DateAmount    Deposited    Running Balance
31st Dec       100 rupees       100
1st  Jan       500 rupees       600
11th Jan       500 rupees       1100
15th Jan       1000 rupees      2100

--! This is known as Rolling Total/ cumulative Total.

CREATE TABLE bank_transactions (
    transaction_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    transaction_date DATE,
    transaction_type VARCHAR(20),  ---DEPOSIT/WITHDRAW
    amount DECIMAL(10,2)
);


INSERT INTO bank_transactions (
    transaction_id,
    account_holder,
    transaction_date,
    transaction_type,
    amount
)
VALUES
(1, 'Shubham', '2026-01-01', 'DEPOSIT', 1000),
(2, 'Shubham', '2026-01-03', 'WITHDRAW', -200),
(3, 'Shubham', '2026-01-05', 'DEPOSIT', 500),
(4, 'Shubham', '2026-01-07', 'WITHDRAW', -100),
(5, 'Rahul', '2026-01-01', 'DEPOSIT', 2000),
(6, 'Rahul', '2026-01-04', 'WITHDRAW', -300),
(7, 'Rahul', '2026-01-06', 'DEPOSIT', 400);

SELECT * FROM bank_transactions;


SELECT 
*,
SUM(amount) OVER(
    PARTITION BY account_holder
    ORDER BY transaction_date --sort the window, not the table.
    ) AS closing_Balance
FROM bank_transactions;


--!