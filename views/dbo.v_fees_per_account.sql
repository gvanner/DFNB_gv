/********************************************************************************************
NAME:    [dbo].[v_fees_per_account]
PURPOSE: Create the [dbo].[v_fees_per_account] view

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/27/2020  GVANNER   1. Created the view

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


DROP VIEW IF EXISTS [dbo].[v_fees_per_account];
GO
CREATE VIEW v_fees_per_account
AS
(
    SELECT [acct_id], 
           CONVERT(DECIMAL(15, 3), SUM([transaction_amt])) AS total_transactions, 
           SUM([transaction_fee_amt]) AS total_fees, 
           CONVERT(DECIMAL(3, 2), (SUM([transaction_fee_amt]) / SUM([transaction_amt]) * 100)) AS percentage
    FROM [dbo].[t_transaction_fact]
    GROUP BY [acct_id]
);