/********************************************************************************************
NAME:    data_output
PURPOSE: Output the data to create reports

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/06/2020  GVANNER   1. Created the script
1.1   06/27/2020  GVANNER   2. Added transaction views
1.2   07/04/2020  GVANNER   2. Added all_transactions view

RUNTIME: 
1 min

NOTES: 
(None)

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

********************************************************************************************/

USE [DFNB2]
SELECT *
FROM [dbo].[v_new_accounts]
ORDER BY 2,1 DESC

/*******************************************************************************************/

USE [DFNB2]
SELECT *
FROM [dbo].[v_new_customers]
ORDER BY 2,1 DESC

/*******************************************************************************************/

USE [DFNB2]
SELECT *
FROM [dbo].[v_new_loans]
ORDER BY 4,1 DESC,3 DESC

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_balance]
ORDER BY 1, 4, 8 DESC;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_accounts_per_customer_per_year]
ORDER BY 6,1,2;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_customers_per_client]

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_fees_per_account]
ORDER BY 3 DESC, 
         4 DESC, 
         1;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_fees_per_branch]
ORDER BY 3 DESC, 
         4 DESC, 
         1;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transaction_type];

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transactions_at_other_branches]
ORDER BY 1, 
         2;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transactions_volume]
ORDER BY 3, 
         2, 
         1;

/********************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_all_transactions];