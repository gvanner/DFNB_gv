/********************************************************************************************
NAME:    DFNB2
PURPOSE: Create a schema running script for generating the complete database

SUPPORT: George Vanner
         gvanner@gmail.com

MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   06/10/2020  GVANNER   1. Created the script

RUNTIME: 
2 min

NOTES: 
(None)

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

********************************************************************************************/

USE [DFNB2]
GO
ALTER TABLE [dbo].[t_customer_dim] DROP CONSTRAINT [FK_t_customer_dim_t_branch_dim]
GO
ALTER TABLE [dbo].[t_customer_dim] DROP CONSTRAINT [FK_t_customer_dim_t_address_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim] DROP CONSTRAINT [FK_t_customer_account_dim_t_customer_role_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim] DROP CONSTRAINT [FK_t_customer_account_dim_t_customer_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim] DROP CONSTRAINT [FK_t_customer_account_dim_t_account_dim]
GO
ALTER TABLE [dbo].[t_branch_dim] DROP CONSTRAINT [FK_t_branch_dim_t_region_dim]
GO
ALTER TABLE [dbo].[t_branch_dim] DROP CONSTRAINT [FK_t_branch_dim_t_area_dim]
GO
ALTER TABLE [dbo].[t_branch_dim] DROP CONSTRAINT [FK_t_branch_dim_t_address_dim]
GO
ALTER TABLE [dbo].[t_account_fact] DROP CONSTRAINT [FK_t_account_fact_t_account_dim]
GO
ALTER TABLE [dbo].[t_account_dim] DROP CONSTRAINT [FK_t_account_dim_t_product_dim]
GO
ALTER TABLE [dbo].[t_account_dim] DROP CONSTRAINT [FK_t_account_dim_t_customer_dim]
GO
ALTER TABLE [dbo].[t_account_dim] DROP CONSTRAINT [FK_t_account_dim_t_branch_dim]
GO
/****** Object:  Table [dbo].[t_region_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_region_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_region_dim]
GO
/****** Object:  Table [dbo].[t_product_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_product_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_product_dim]
GO
/****** Object:  Table [dbo].[t_customer_role_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_customer_role_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_customer_role_dim]
GO
/****** Object:  Table [dbo].[t_area_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_area_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_area_dim]
GO
/****** Object:  Table [dbo].[t_address_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_address_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_address_dim]
GO
/****** Object:  View [dbo].[v_new_loans]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_new_loans]
GO
/****** Object:  View [dbo].[v_new_customers]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_new_customers]
GO
/****** Object:  View [dbo].[v_new_accounts]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_new_accounts]
GO
/****** Object:  Table [dbo].[t_branch_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_branch_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_branch_dim]
GO
/****** Object:  View [dbo].[v_customers_per_client]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_customers_per_client]
GO
/****** Object:  View [dbo].[v_balance]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_balance]
GO
/****** Object:  Table [dbo].[t_account_fact]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_account_fact]') AND type in (N'U'))
DROP TABLE [dbo].[t_account_fact]
GO
/****** Object:  View [dbo].[v_accounts_per_customer_per_year]    Script Date: 10-Jun-20 23:49:45 ******/
DROP VIEW [dbo].[v_accounts_per_customer_per_year]
GO
/****** Object:  Table [dbo].[t_customer_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_customer_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_customer_dim]
GO
/****** Object:  Table [dbo].[t_customer_account_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_customer_account_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_customer_account_dim]
GO
/****** Object:  Table [dbo].[t_account_dim]    Script Date: 10-Jun-20 23:49:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_account_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_account_dim]
GO
/****** Object:  Table [dbo].[t_account_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_account_dim](
	[acct_id] [int] NOT NULL,
	[acct_open_date] [date] NOT NULL,
	[acct_close_date] [date] NOT NULL,
	[acct_open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[primary_cust_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_t_account_dim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_customer_account_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_customer_account_dim](
	[customer_account_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cust_role_id] [int] NOT NULL,
 CONSTRAINT [PK_t_customer_account_dim] PRIMARY KEY CLUSTERED 
(
	[customer_account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_customer_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_customer_dim](
	[cust_id] [int] NOT NULL,
	[cust_last_name] [varchar](100) NOT NULL,
	[cust_first_name] [varchar](100) NOT NULL,
	[cust_gender] [varchar](1) NOT NULL,
	[cust_birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[cust_pri_branch_dist] [decimal](7, 2) NOT NULL,
	[relationship_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[primary_branch_id] [int] NOT NULL,
 CONSTRAINT [PK_t_customer_dim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_accounts_per_customer_per_year]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_accounts_per_customer_per_year]
AS
select DATEPART(YEAR, cd.[cust_since_date]) AS year
		,cd.[cust_id]
		,(cd.cust_first_name + ' ' +cd.cust_last_name) as customer_name
		,cad.cust_role_id
		,COUNT(cad.[acct_id]) as accounts
		,cd.[relationship_id]
		,CONVERT(DECIMAL(10, 0),SUM(ad.loan_amt)) as loans
from [dbo].[t_customer_dim] as cd
join [dbo].[t_customer_account_dim] as cad on cd.[cust_id] = cad.cust_id
join [dbo].[t_account_dim] as ad on ad.acct_id = cad.acct_id
group by DATEPART(YEAR, cd.[cust_since_date])
,cd.[cust_id]
,(cd.cust_first_name + ' ' +cd.cust_last_name)
,cad.cust_role_id
,cd.[relationship_id];
GO
/****** Object:  Table [dbo].[t_account_fact]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_account_fact](
	[as_of_date] [date] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cur_balance] [decimal](20, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_balance]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_balance]
AS
     SELECT af.acct_id, 
            ad.acct_open_date AS loan_date, 
            CONVERT(DECIMAL(10, 0), ad.loan_amt) AS loan_amt, 
            af.as_of_date AS balance_date, 
            ROW_NUMBER() OVER(PARTITION BY af.acct_id, 
                                           ad.loan_amt
            ORDER BY af.acct_id, 
                     af.as_of_date, 
                     af.cur_balance DESC) AS period, 
            CONVERT(DECIMAL(10, 0), (CASE
                                         WHEN LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                                     ORDER BY af.acct_id, 
                                              af.as_of_date, 
                                              af.cur_balance DESC) IS NULL
                                         THEN ad.loan_amt
                                         ELSE LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                                         ORDER BY af.acct_id, 
                                                  af.as_of_date, 
                                                  af.cur_balance DESC)
                                     END)) AS previous_balance, 
            CONVERT(DECIMAL(10, 0), af.cur_balance - CASE
                                                         WHEN LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                                                     ORDER BY af.acct_id, 
                                                              af.as_of_date, 
                                                              af.cur_balance DESC) IS NULL
                                                         THEN ad.loan_amt
                                                         ELSE LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                                                         ORDER BY af.acct_id, 
                                                                  af.as_of_date, 
                                                                  af.cur_balance DESC)
                                                     END) AS payment, 
            CONVERT(DECIMAL(10, 0), af.cur_balance) AS current_balance,
            CASE
                WHEN CASE
                         WHEN LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                     ORDER BY af.acct_id, 
                              af.as_of_date, 
                              af.cur_balance DESC) IS NULL
                         THEN ad.loan_amt
                         ELSE LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                         ORDER BY af.acct_id, 
                                  af.as_of_date, 
                                  af.cur_balance DESC)
                     END < af.[cur_balance]
                THEN 'MORE CHARGES ADDED'
                WHEN CASE
                         WHEN LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                     ORDER BY af.acct_id, 
                              af.as_of_date, 
                              af.cur_balance DESC) IS NULL
                         THEN ad.loan_amt
                         ELSE LAG(af.cur_balance, 1) OVER(PARTITION BY af.acct_id
                         ORDER BY af.acct_id, 
                                  af.as_of_date, 
                                  af.cur_balance DESC)
                     END > af.[cur_balance]
                THEN 'PAYMENT DONE'
                ELSE 'NO PAYMENT IN THE PERIOD'
            END AS Payment_Status
     FROM dbo.t_account_fact AS af
          JOIN dbo.t_account_dim AS ad ON ad.acct_id = af.acct_id;
GO
/****** Object:  View [dbo].[v_customers_per_client]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_customers_per_client]
AS
select DATEPART(YEAR, cd.[cust_since_date]) AS year
		,cad.[acct_id]
		,COUNT(cd.[cust_id]) as customers
		,cd.[relationship_id]
		,CONVERT(DECIMAL(10, 0),SUM(ad.loan_amt)) as loans
from [dbo].[t_customer_dim] as cd
join [dbo].[t_customer_account_dim] as cad on cd.[cust_id] = cad.cust_id
join [dbo].[t_account_dim] as ad on ad.acct_id = cad.acct_id
group by DATEPART(YEAR, cd.[cust_since_date])
,cad.[acct_id]
,cad.cust_role_id
,cd.[relationship_id];
GO
/****** Object:  Table [dbo].[t_branch_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_branch_dim](
	[branch_id] [int] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_description] [varchar](100) NOT NULL,
	[address_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
 CONSTRAINT [PK_t_branch_dim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_new_accounts]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_new_accounts]
AS
     SELECT DATEPART(YEAR, ad.[acct_open_date]) AS Year, 
            bd.[branch_code] AS Branch, 
            bd.[region_id] AS Region, 
            bd.[area_id] AS Area, 
            COUNT(ad.[acct_id]) AS Total_New_Accounts
     FROM [dbo].[t_account_dim] AS ad
          JOIN [dbo].[t_branch_dim] AS bd ON bd.[branch_id] = ad.[branch_id]
          JOIN [dbo].[t_customer_dim] AS cd ON cd.[cust_id] = ad.[primary_cust_id]
     GROUP BY DATEPART(YEAR, ad.[acct_open_date]), 
              bd.[branch_code], 
              bd.[region_id], 
              bd.[area_id];
GO
/****** Object:  View [dbo].[v_new_customers]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_new_customers]
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
GO
/****** Object:  View [dbo].[v_new_loans]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_new_loans]
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
GO
/****** Object:  Table [dbo].[t_address_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_address_dim](
	[address_id] [int] NOT NULL,
	[address_type] [varchar](1) NOT NULL,
	[latitude] [decimal](16, 12) NOT NULL,
	[longitude] [decimal](16, 12) NOT NULL,
 CONSTRAINT [PK_t_address_dim] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_area_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_area_dim](
	[area_id] [int] NOT NULL,
	[area_name] [varchar](50) NULL,
 CONSTRAINT [PK_t_area_dim] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_customer_role_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_customer_role_dim](
	[cust_role_id] [int] NOT NULL,
	[cust_role_description] [varchar](100) NULL,
 CONSTRAINT [PK_t_customer_role_dim] PRIMARY KEY CLUSTERED 
(
	[cust_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_product_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_product_dim](
	[product_id] [int] NOT NULL,
	[product_description] [varchar](100) NULL,
 CONSTRAINT [PK_t_product_dim] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_region_dim]    Script Date: 10-Jun-20 23:49:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_region_dim](
	[region_id] [int] NOT NULL,
	[region_name] [varchar](50) NULL,
 CONSTRAINT [PK_t_region_dim] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_account_dim_t_branch_dim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[t_branch_dim] ([branch_id])
GO
ALTER TABLE [dbo].[t_account_dim] CHECK CONSTRAINT [FK_t_account_dim_t_branch_dim]
GO
ALTER TABLE [dbo].[t_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_account_dim_t_customer_dim] FOREIGN KEY([primary_cust_id])
REFERENCES [dbo].[t_customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[t_account_dim] CHECK CONSTRAINT [FK_t_account_dim_t_customer_dim]
GO
ALTER TABLE [dbo].[t_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_account_dim_t_product_dim] FOREIGN KEY([product_id])
REFERENCES [dbo].[t_product_dim] ([product_id])
GO
ALTER TABLE [dbo].[t_account_dim] CHECK CONSTRAINT [FK_t_account_dim_t_product_dim]
GO
ALTER TABLE [dbo].[t_account_fact]  WITH CHECK ADD  CONSTRAINT [FK_t_account_fact_t_account_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[t_account_dim] ([acct_id])
GO
ALTER TABLE [dbo].[t_account_fact] CHECK CONSTRAINT [FK_t_account_fact_t_account_dim]
GO
ALTER TABLE [dbo].[t_branch_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_branch_dim_t_address_dim] FOREIGN KEY([address_id])
REFERENCES [dbo].[t_address_dim] ([address_id])
GO
ALTER TABLE [dbo].[t_branch_dim] CHECK CONSTRAINT [FK_t_branch_dim_t_address_dim]
GO
ALTER TABLE [dbo].[t_branch_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_branch_dim_t_area_dim] FOREIGN KEY([area_id])
REFERENCES [dbo].[t_area_dim] ([area_id])
GO
ALTER TABLE [dbo].[t_branch_dim] CHECK CONSTRAINT [FK_t_branch_dim_t_area_dim]
GO
ALTER TABLE [dbo].[t_branch_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_branch_dim_t_region_dim] FOREIGN KEY([region_id])
REFERENCES [dbo].[t_region_dim] ([region_id])
GO
ALTER TABLE [dbo].[t_branch_dim] CHECK CONSTRAINT [FK_t_branch_dim_t_region_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_customer_account_dim_t_account_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[t_account_dim] ([acct_id])
GO
ALTER TABLE [dbo].[t_customer_account_dim] CHECK CONSTRAINT [FK_t_customer_account_dim_t_account_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_customer_account_dim_t_customer_dim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[t_customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[t_customer_account_dim] CHECK CONSTRAINT [FK_t_customer_account_dim_t_customer_dim]
GO
ALTER TABLE [dbo].[t_customer_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_customer_account_dim_t_customer_role_dim] FOREIGN KEY([cust_role_id])
REFERENCES [dbo].[t_customer_role_dim] ([cust_role_id])
GO
ALTER TABLE [dbo].[t_customer_account_dim] CHECK CONSTRAINT [FK_t_customer_account_dim_t_customer_role_dim]
GO
ALTER TABLE [dbo].[t_customer_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_customer_dim_t_address_dim] FOREIGN KEY([address_id])
REFERENCES [dbo].[t_address_dim] ([address_id])
GO
ALTER TABLE [dbo].[t_customer_dim] CHECK CONSTRAINT [FK_t_customer_dim_t_address_dim]
GO
ALTER TABLE [dbo].[t_customer_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_customer_dim_t_branch_dim] FOREIGN KEY([primary_branch_id])
REFERENCES [dbo].[t_branch_dim] ([branch_id])
GO
ALTER TABLE [dbo].[t_customer_dim] CHECK CONSTRAINT [FK_t_customer_dim_t_branch_dim]
GO
