/********************************************************************************************
NAME:    [dbo].[t_transaction_type_dim]
PURPOSE: Create the [dbo].[t_transaction_type_dim] table

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/27/2020  GVANNER   1. Created the table

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

DROP TABLE IF EXISTS t_transaction_type_dim;

CREATE TABLE t_transaction_type_dim ( 
             transaction_type_id     INT NOT NULL , 
             transaction_type_code   VARCHAR(3) NOT NULL , 
             transaction_type_desc   VARCHAR(100) NOT NULL , 
             transaction_fee_prct    DECIMAL(4 , 3) NOT NULL , 
             cur_cust_req_ind VARCHAR(1) NOT NULL CONSTRAINT PK_t_transaction_type_dim PRIMARY KEY CLUSTERED(transaction_type_id ASC)
                                    );