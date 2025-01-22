select 
    "Insured",
    "Policy Name",
    "Effective Date",
    "Expiration Date",
    "Risk Tier",
    "Duration (Months)",
    "GL Attachment",	
    "Gross Written Premium",	
    "TRIA Fee Percentage",
    "Employer's Liability Fee Percentage",
    "GL Selected Loss Cost",	
    "AL Selected Loss Cost",
    "Commission (%)",
    "Fee (%)",	
    "Total Expense Load Percentage",
    "Profit Load Percentage",
    "Business Type",
    "Total Rate Change on Payroll and Power Units",	
    "UW Impact Rate Change",	
    "GL Rate Change on Payroll",	
    "AL Rate Change on Power Units",	
    "Total Rate Change on Sales",	
    "Pricing Adequacy",	
    "Product",	
    "Umbrella or Excess",	
    "Quota Share",
    "Selected",
    "Benchmark",
    "Status"
    from {{#3996-actuarial-slr-duplicate}} 
    where true
    and "Status" not in ('BLOCKED', 'DECLINED','QUOTED_LOST', 'INDICATED_LOST')
    and "Product" in ('EXCESS_ADMITTED_PRACTICE','EXCESS_ADMITTED_PROJECT','EXCESS_NON_ADMITTED_PRACTICE','EXCESS_NON_ADMITTED_PROJECT')
    order by "Effective Date"