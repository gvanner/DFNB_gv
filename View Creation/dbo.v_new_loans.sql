/********************************************************************************************
NAME:    [dbo].[v_new_loans]
PURPOSE: Create the [dbo].[v_new_loans] view

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/06/2020  GVANNER   1. Created the view

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

DROP VIEW IF EXISTS [dbo].[v_new_loans];
GO
CREATE VIEW v_new_loans
AS
     SELECT DATEPART(YEAR, ad.[acct_open_date]) AS Year, 
            af.[acct_id], 
            MAX(ad.[loan_amt]) AS Total_Loans, 
            bd.[branch_code], 
            bd.[region_id] AS Region, 
            bd.[area_id] AS Area
     FROM [dbo].[t_account_dim] AS ad
          JOIN [dbo].[t_account_fact] AS af ON ad.[acct_id] = af.[acct_id]
          JOIN [dbo].[t_branch_dim] AS bd ON bd.[branch_id] = ad.[branch_id]
     GROUP BY DATEPART(YEAR, ad.[acct_open_date]), 
              af.[acct_id], 
              bd.[branch_code], 
              bd.[region_id], 
              bd.[area_id];