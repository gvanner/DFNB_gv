/********************************************************************************************
NAME:    [dbo].[v_all_transactions]
PURPOSE: Create the [dbo].[v_all_transactions] view

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   07/04/2020  GVANNER   1. Created the view

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

DROP VIEW IF EXISTS [dbo].[v_all_transactions];
GO
CREATE VIEW v_all_transactions
AS
(
    SELECT (cd.cust_first_name + ' ' + cd.cust_last_name) as customer_name,
           cd.[cust_gender], 
           (2019 - DATEPART(YEAR, cd.[cust_birth_date])) AS age, 
           tf.[transaction_date], 
           tf.[transaction_time], 
           bd.[branch_description],
           tf.[acct_id], 
           ttd.[transaction_type_desc], 
           tf.[transaction_amt], 
           tf.[transaction_fee_amt]
    FROM [dbo].[t_transaction_fact] AS tf
         JOIN [dbo].[t_transaction_type_dim] AS ttd ON tf.transaction_type_id = ttd.transaction_type_id
     JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
         JOIN [dbo].[t_account_dim] AS ad ON tf.acct_id = ad.acct_id
         JOIN [dbo].[t_customer_dim] AS cd ON cd.cust_id = ad.primary_cust_id
  WHERE (cd.cust_first_name + ' ' + cd.cust_last_name) NOT LIKE '%unknown%'
);