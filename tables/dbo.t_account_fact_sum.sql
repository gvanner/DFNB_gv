/********************************************************************************************
NAME:    [dbo].[t_account_fact_sum]
PURPOSE: Create the [dbo].[t_account_fact_sum] table

SUPPORT: George Vanner
	     gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   07/16/2020  GVANNER   1. Created the table

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
USE [DFNB2];

DROP TABLE IF EXISTS t_account_fact_sum;

CREATE TABLE t_account_fact_sum ( 
             as_of_date  DATE NOT NULL , 
             acct_id     INT NOT NULL , 
             balance DECIMAL(20 , 4) NOT NULL);