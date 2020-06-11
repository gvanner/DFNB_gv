/********************************************************************************************
NAME:    [dbo].[t_customer_dim]
PURPOSE: Create the [dbo].[t_customer_dim] table

SUPPORT: George Vanner
	     gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/06/2020  GVANNER   1. Created the table

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

DROP TABLE IF EXISTS t_customer_dim;

CREATE TABLE t_customer_dim ( 
             cust_id              INT NOT NULL , 
             cust_last_name       VARCHAR(100) NOT NULL , 
             cust_first_name      VARCHAR(100) NOT NULL , 
             cust_gender          VARCHAR(1) NOT NULL , 
             cust_birth_date      DATE NOT NULL , 
             cust_since_date      DATE NOT NULL , 
             cust_pri_branch_dist DECIMAL(7 , 2) NOT NULL , 
             relationship_id      INT NOT NULL , 
             address_id           INT NOT NULL , 
             primary_branch_id    INT NOT NULL CONSTRAINT PK_t_customer_dim PRIMARY KEY CLUSTERED(cust_id ASC)
                            );