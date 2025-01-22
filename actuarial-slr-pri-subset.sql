select 
      "Insured"
    , "Policy Name"
    , "Effective Date"
    , "Expiration Date"
    , "Risk Tier"
    , "Duration (Months)"
    , "Limit"
    , "Gross Written Premium"
    , "GL GWP (Primary Only)"
    , "AL GWP (Primary Only)"
    , "APD GWP (Primary Only)"
    , "WC GWP (Primary Only)"
    , "GL Risk Transfer Loss Cost"
    , "AL Risk Transfer Loss Cost"
    , "APD Risk Transfer Loss Cost"
    , "GL Selected Premium"
    , "AL Selected Premium"
    , "APD Selected Premium"
    , "GL Benchmark Premium"
    , "AL Benchmark Premium"
    , "APD Benchmark Premium"
    , "Pricing Adequacy"
    , "GL Pricing Adequacy"
    , "AL Pricing Adequacy"
    , "APD Pricing Adequacy"
    , CASE 
        WHEN "GL GWP (Primary Only)" > 0 
        THEN "GL Commission (%)"
    END AS "GL Commission (%)"
    , CASE 
        WHEN "AL GWP (Primary Only)" > 0 
        THEN "AL Commission (%)"
    END AS "AL Commission (%)"
        -- , "APD Commission (%)"
    , CASE 
        WHEN "GL GWP (Primary Only)" > 0 
        THEN "GL Fee (%)"
    END AS "GL Fee (%)"
    , CASE 
        WHEN "AL GWP (Primary Only)" > 0 
        THEN "AL Fee (%)"
    END AS "AL Fee (%)"
    -- , "APD Fee (%)"
    , CASE 
        WHEN "GL GWP (Primary Only)" > 0 
        THEN "GL Expense Load (%)"
    END AS "GL Expense Load (%)"
    , CASE 
        WHEN "AL GWP (Primary Only)" > 0 
        THEN "AL Expense Load (%)"
    END AS "AL Expense Load (%)"
    , CASE 
        WHEN "APD GWP (Primary Only)" > 0 
        THEN "APD Expense Load (%)"
    END AS "APD Expense Load (%)"
    , "GL Profit Load (%)"
    , "AL Profit Load (%)"
    -- , "APD Profit Load (%)"
    , "Business Type"
    , "Total Rate Change on Payroll and Power Units"
    , "UW Impact Rate Change"
    , "GL Rate Change on Payroll"
    , "AL Rate Change on Power Units"
    , "Total Rate Change on Sales"
    , "Product"
    , "Quota Share"
    , "GL LCM"
    , "AL LCM"
    , "Status"
    , "TPA Claims Handling Charge"
    , "TPA Charge (Non-Claims Handling)"
    , "Total Loss Aggregate Charge"
    , "Total Bad Debt Charge"
    , "GL Initial Premium"
    , "AL Initial Premium"
    , "Initial Premium"
    , "GL Charges"
    , "AL Charges"
    , "APD Charges"

from {{#3996-actuarial-slr-duplicate}} 
where true
    and "Status" not in ('BLOCKED', 'DECLINED','QUOTED_LOST', 'INDICATED_LOST')
    and "Product" not in ('EXCESS_ADMITTED_PRACTICE','EXCESS_ADMITTED_PROJECT','EXCESS_NON_ADMITTED_PRACTICE','EXCESS_NON_ADMITTED_PROJECT')
order by "Effective Date"