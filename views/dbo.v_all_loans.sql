/********************************************************************************************
NAME:    [dbo].[v_all_loans]
PURPOSE: Create the [dbo].[v_all_loans] view

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   07/16/2020  GVANNER   1. Created the view

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

DROP VIEW IF EXISTS dbo.v_all_loans;
GO

CREATE VIEW v_all_loans
AS
     SELECT DATEPART(YEAR, ad.acct_open_date) AS Year
          , bd.branch_description AS Branch
          , SUM(ad.loan_amt) AS Loans
       FROM dbo.t_account_dim AS ad
            JOIN
            dbo.t_account_fact AS af ON ad.acct_id = af.acct_id
            JOIN
            dbo.t_branch_dim AS bd ON bd.branch_id = ad.branch_id
      GROUP BY YEAR(ad.acct_open_date)
             , bd.branch_description;