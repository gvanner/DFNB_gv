/********************************************************************************************
NAME:    [dbo].[v_new_customers]
PURPOSE: Create the [dbo].[v_new_customers] view

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

DROP VIEW IF EXISTS [dbo].[v_new_customers];
GO
CREATE VIEW v_new_customers
AS
     SELECT DATEPART(YEAR, cd.[cust_since_date]) AS Year, 
            bd.[branch_code] AS Branch, 
            bd.[region_id] AS Region, 
            bd.[area_id] AS Area, 
            COUNT(cd.[cust_id]) AS Total_New_Customers
     FROM [dbo].[t_customer_dim] AS cd
          JOIN [dbo].[t_branch_dim] AS bd ON cd.[primary_branch_id] = bd.[branch_id]
     GROUP BY DATEPART(YEAR, cd.[cust_since_date]), 
              bd.[branch_code], 
              bd.[region_id], 
              bd.[area_id];