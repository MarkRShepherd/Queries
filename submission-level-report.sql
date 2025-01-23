WITH total_payroll_gl as (
  SELECT 
  "exposureId", 
  SUM(payroll) as "sum_payroll"
  FROM public."ExcessGeneralLiabilityExpectedPayroll"
  GROUP  BY "exposureId"),
  
primary_pricing_data as (
  
select 
  "id", 
  "finalPremium",
  "generalLiabilityTotalPolicyPremium",
  "autoLiabilityTotalPolicyPremium",
  "autoPhysDamTotalPolicyPremium",
  "workersCompensationTotalPolicyPremium",
  "shepherdFee", 
  "brokerageCommission", 
  "profitLoad",
  "totalBenchmarkPremium",
  "totalSelectedPremium",
  "totalPricingAdequacy",
  "triaCoverage",
  "quoteDetailId",
  COALESCE(
    "generalLiabilityProfitLoadPercentage", 
    0
  ) + COALESCE(
    "autoLiabilityProfitLoadPercentage", 
    0
  ) as "totalProfitLoadPercentage",
  COALESCE(
    "generalLiabilityTotalExpenseLoad", 
    0
  ) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) as "totalExpenseLoadPercentage",
  COALESCE(
    "generalLiabilityBrokerageCommissionPercentage", 
    0
  ) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) as "totalBrokerageCommissionPercentage",
    COALESCE(
    "generalLiabilityShepherdFeePercentage", 
    0
  ) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) as "totalShepherdFeePercentage",
  "generalLiabilityAdjustedLossPick"  as "generalLiabilitySelectedLossCost",
  "autoLiabilityAdjustedLossPick" as "autoLiabilitySelectedLossCost",
  "totalSelectedLossPick" as "totalSelectedLossCost"
from 
  "PrimaryProjectFinalPricing" 
  
UNION 

select 
  "id", 
  "finalPremium",
  "generalLiabilityTotalPolicyPremium",
  "autoLiabilityTotalPolicyPremium",
  "autoPhysDamTotalPolicyPremium",
  "workersCompensationTotalPolicyPremium",
  "shepherdFee", 
  "brokerageCommission", 
  "profitLoad", 
  "totalBenchmarkPremium",
  "totalSelectedPremium",
  "totalPricingAdequacy",
  "triaCoverage",
  "quoteDetailId", 
  COALESCE(
    "generalLiabilityProfitLoadPercentage", 
    0
  ) + COALESCE(
    "autoLiabilityProfitLoadPercentage", 
    0
  ) as "totalProfitLoadPercentage",
    COALESCE(
    "generalLiabilityTotalExpenseLoad", 
    0
  ) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) as "totalExpenseLoadPercentage",
    COALESCE(
    "generalLiabilityBrokerageCommissionPercentage", 
    0
  ) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) as "totalBrokerageCommissionPercentage",
    COALESCE(
    "generalLiabilityShepherdFeePercentage", 
    0
  ) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) as "totalShepherdFeePercentage",
  "generalLiabilityAdjustedLossPick"  as "generalLiabilitySelectedLossCost",
  "autoLiabilityAdjustedLossPick" as "autoLiabilitySelectedLossCost",
  "totalSelectedLossPick" as "totalSelectedLossCost"
from 
  "PrimaryPracticeFinalPricing" 
  
UNION 

select 
  "id", 
  "finalPremium",
  "generalLiabilityTotalPolicyPremium",
  "autoLiabilityTotalPolicyPremium",
  "autoPhysDamTotalPolicyPremium",
  "workersCompensationTotalPolicyPremium",
  "shepherdFee", 
  "brokerageCommission", 
  "profitLoad", 
  "totalBenchmarkPremium",
  "totalSelectedPremium",
  "totalPricingAdequacy",
  "triaCoverage",
  "quoteDetailId", 
  COALESCE(
    "generalLiabilityProfitLoadPercentage", 
    0
  ) + COALESCE(
    "autoLiabilityProfitLoadPercentage", 
    0
  ) as "totalProfitLoadPercentage",
    COALESCE(
    "generalLiabilityTotalExpenseLoad", 
    0
  ) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) as "totalExpenseLoadPercentage",

    COALESCE(
    "generalLiabilityBrokerageCommissionPercentage", 
    0
  ) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) as "totalBrokerageCommissionPercentage",
    COALESCE(
    "generalLiabilityShepherdFeePercentage", 
    0
  ) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) as "totalShepherdFeePercentage",
  "generalLiabilityAdjustedLossPick"  as "generalLiabilitySelectedLossCost",
  "autoLiabilityAdjustedLossPick" as "autoLiabilitySelectedLossCost",
  "totalSelectedLossPick" as "totalSelectedLossCost"
from 
  "PrimaryNonAdmittedPracticeFinalPricing" 

UNION 

select 
  "id", 
  "finalPremium",
  "generalLiabilityTotalPolicyPremium",
  "autoLiabilityTotalPolicyPremium",
  "autoPhysDamTotalPolicyPremium",
  "workersCompensationTotalPolicyPremium",
  "shepherdFee", 
  "brokerageCommission", 
  "profitLoad",
  "totalBenchmarkPremium",
  "totalSelectedPremium",
  "totalPricingAdequacy", 
  "triaCoverage",
  "quoteDetailId", 
  COALESCE(
    "generalLiabilityProfitLoadPercentage", 
    0
  ) + COALESCE(
    "autoLiabilityProfitLoadPercentage", 
    0
  ) as "totalProfitLoadPercentage",
    COALESCE(
    "generalLiabilityTotalExpenseLoad", 
    0
  ) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) as "totalExpenseLoadPercentage",
    COALESCE(
    "generalLiabilityBrokerageCommissionPercentage", 
    0
  ) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) as "totalBrokerageCommissionPercentage",
    COALESCE(
    "generalLiabilityShepherdFeePercentage", 
    0
  ) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) as "totalShepherdFeePercentage",
    "generalLiabilityAdjustedLossPick"  as "generalLiabilitySelectedLossCost",
  "autoLiabilityAdjustedLossPick" as "autoLiabilitySelectedLossCost",
  "totalSelectedLossPick" as "totalSelectedLossCost"
from 
  "PrimaryNonAdmittedProjectFinalPricing"
),
  
total_payroll_proj as (
SELECT 
  "exposureId", 
  SUM(payroll) as "sum_payroll"
FROM public."ProjectExcessGeneralLiabilityExpectedPayroll"
GROUP BY "exposureId"),
  
total_payroll_primary_project as (
  SELECT 
  "exposureId", 
  SUM(payroll) as "sum_payroll"
  FROM public."ProjectPrimaryGeneralLiabilityExpectedPayroll"
  GROUP  BY "exposureId"),
  
 total_payroll_primary_practice as (
  SELECT 
  "exposureId", 
  SUM(payroll) as "sum_payroll"
  FROM public."PrimaryGeneralLiabilityExpectedPayroll"
  GROUP  BY "exposureId"),
  
excess_vehicles as (
select  
    "exposureId", 
    count(id) as count
from "ExcessAutoVehicleV2"
group by "exposureId"
),

primary_vehicles as (
select  
    "exposureId", 
    count(id) as count
from "PrimaryAutoVehicle"
group by "exposureId"
),

benchmark as (
SELECT 
"QuoteDetail".id
, qs."quotaShare"
, xqp."totalExcessBenchmarkLossCost"
, pxqp."totalExcessBenchmarkLossCost"
, coalesce(
    ((xqp."totalExcessBenchmarkLossCost"+coalesce(xqp."perProjectAggregateCharge", 0)+coalesce(qs."excessOfWrap", 0))*qs."quotaShare"),
    ((pxqp."totalExcessBenchmarkLossCost"+coalesce(pxqp."perProjectAggregateCharge", 0)+coalesce(qs."excessOfWrap", 0))*qs."quotaShare"),
    ((xafp_prac."totalExcessBenchmarkLossCost"+coalesce(xafp_prac."perProjectAggregateCharge", 0)+coalesce(qs."excessOfWrap", 0))*qs."quotaShare"),
    ((xafp_proj."excessBenchmarkLossCostGeneralLiability"+coalesce(xafp_proj."perProjectAggregateCharge", 0)+coalesce(qs."excessOfWrap", 0))*qs."quotaShare")
  ) AS "Benchmark" 
FROM "QuoteDetail"
LEFT OUTER JOIN "QuotePricing" qp ON qp."quoteDetailId" = "QuoteDetail".id
LEFT OUTER JOIN "QuoteSelection" qs on qs."quoteDetailId" = "QuoteDetail".id 
LEFT OUTER JOIN "ExcessQuotePricing" xqp ON xqp."quotePricingId"= qp.id
LEFT OUTER JOIN "ProjectExcessQuotePricing" pxqp ON pxqp."quotePricingId"= qp.id
LEFT OUTER JOIN "ExcessAdmittedPracticeFinalPricing" xafp_prac ON xafp_prac."quotePricingId"= qp.id
LEFT OUTER JOIN "ExcessAdmittedProjectFinalPricing" as xafp_proj ON xafp_proj."quotePricingId"= qp.id
LEFT OUTER JOIN "PrimaryProjectFinalPricing" as primary_project_final_pricing ON primary_project_final_pricing."quoteDetailId" = "QuoteDetail".id
),

  
highest_iso_class_gl as (
  SELECT DISTINCT ON ("exposureId")
  "exposureId", 
  "isoClass",
  SUM(payroll)
  FROM public."ExcessGeneralLiabilityExpectedPayroll"
  GROUP BY "exposureId","isoClass"
  ORDER  BY "exposureId",  SUM(payroll) DESC),

  
highest_iso_class_proj as (
  SELECT DISTINCT ON ("exposureId")
  "exposureId", 
  "isoClass", 
  SUM(payroll)
  FROM public."ProjectExcessGeneralLiabilityExpectedPayroll"
  GROUP BY "exposureId","isoClass"
  ORDER  BY "exposureId", SUM(payroll) DESC),
  
highest_iso_class_primary_practice as (
  SELECT DISTINCT ON ("exposureId")
  "exposureId", 
  "isoClass", 
  SUM(payroll)
  FROM public."PrimaryGeneralLiabilityExpectedPayroll"
  GROUP BY "exposureId","isoClass"
  ORDER  BY "exposureId", SUM(payroll) DESC),
  
  
highest_iso_class_primary_project as (
  SELECT DISTINCT ON ("exposureId")
  "exposureId", 
  "isoClass", 
  SUM(payroll)
  FROM public."ProjectPrimaryGeneralLiabilityExpectedPayroll"
  GROUP BY "exposureId","isoClass"
  ORDER  BY "exposureId", SUM(payroll) DESC),
  
  
grouped_excess_vehicles_by_size_class as (
select 
	"exposureId",  
  "sizeClass",
  count(id) as vehicle_count
from "ExcessAutoVehicleV2"
group by 1, 2
  ),
  
grouped_primary_vehicles_by_size_class as (
select 
	"exposureId",  
  "sizeClass",
  count(id) as vehicle_count
from "PrimaryAutoVehicle"
group by 1, 2
  ),

formatted_excess_vehicles_by_size_class as (
select 
    "exposureId",
    "quoteDetailId",
    SUM(CASE "sizeClass" WHEN 'PRIVATE_PASSENGER_TYPE' THEN vehicle_count ELSE 0 END) AS "PRIVATE_PASSENGER_TYPE",
    SUM(CASE "sizeClass" WHEN 'LIGHT_TRUCK' THEN vehicle_count ELSE 0 END) AS "LIGHT_TRUCK",
    SUM(CASE "sizeClass" WHEN 'MEDIUM_TRUCK' THEN vehicle_count ELSE 0 END) AS "MEDIUM_TRUCK",
    SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK",
    SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK",
    SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK_TRACTOR",
    SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK_TRACTOR",
    SUM(CASE "sizeClass" WHEN 'SEMI_TRAILER' THEN vehicle_count ELSE 0 END) AS "SEMI_TRAILER",
    SUM(CASE "sizeClass" WHEN 'SERVICE_OR_UTILITY_TRAILER' THEN vehicle_count ELSE 0 END) AS "SERVICE_OR_UTILITY_TRAILER",
    SUM(CASE "sizeClass" WHEN 'TRAILERS' THEN vehicle_count ELSE 0 END) AS "TRAILERS"
from 
	grouped_excess_vehicles_by_size_class as gev
	LEFT OUTER JOIN "ExcessAutoExposure" on "ExcessAutoExposure".id = gev."exposureId"
-- where "exposureId" = '442bb519-d801-4e6e-b464-0f3738474641'  
GROUP BY "exposureId", "quoteDetailId"
),

formatted_primary_vehicles_by_size_class as (
select 
    "exposureId",
    "quoteDetailId",
    SUM(CASE "sizeClass" WHEN 'PRIVATE_PASSENGER_TYPE' THEN vehicle_count ELSE 0 END) AS "PRIVATE_PASSENGER_TYPE",
    SUM(CASE "sizeClass" WHEN 'LIGHT_TRUCK' THEN vehicle_count ELSE 0 END) AS "LIGHT_TRUCK",
    SUM(CASE "sizeClass" WHEN 'MEDIUM_TRUCK' THEN vehicle_count ELSE 0 END) AS "MEDIUM_TRUCK",
    SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK",
    SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK",
    SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK_TRACTOR",
    SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK_TRACTOR",
    SUM(CASE "sizeClass" WHEN 'SEMI_TRAILER' THEN vehicle_count ELSE 0 END) AS "SEMI_TRAILER",
    SUM(CASE "sizeClass" WHEN 'SERVICE_OR_UTILITY_TRAILER' THEN vehicle_count ELSE 0 END) AS "SERVICE_OR_UTILITY_TRAILER",
    SUM(CASE "sizeClass" WHEN 'TRAILERS' THEN vehicle_count ELSE 0 END) AS "TRAILERS"
from 
	grouped_primary_vehicles_by_size_class as gpv
	LEFT OUTER JOIN "PrimaryAutoExposure" on "PrimaryAutoExposure".id = gpv."exposureId"
group by "exposureId", "quoteDetailId"
  ),
  
sum_vehicles as (
select *
from formatted_excess_vehicles_by_size_class
union 
select *
from formatted_primary_vehicles_by_size_class
),

limits as (
SELECT 
"QuoteDetail".id
, qs."quotaShare"
, COALESCE(qs."policyLimit", 0) + COALESCE(primary_general_liability_exposure."eachOccurrenceLimit", 0) 
+ COALESCE(primary_project_general_liability_exposure."eachOccurrenceLimit", 0) as "policyLimit"
, CASE 
    WHEN (qs."quotaShare" < '1') THEN ((COALESCE(qs."policyLimit", 0) + COALESCE(primary_general_liability_exposure."eachOccurrenceLimit", 0) + COALESCE(primary_project_general_liability_exposure."eachOccurrenceLimit", 0))*qs."quotaShare")
    ELSE COALESCE(qs."policyLimit", 0) + COALESCE(primary_general_liability_exposure."eachOccurrenceLimit", 0) + COALESCE(primary_project_general_liability_exposure."eachOccurrenceLimit", 0)
    END AS "Limit" 
FROM "QuoteDetail"
LEFT OUTER JOIN "QuoteSelection" as qs on qs."quoteDetailId" = "QuoteDetail".id 
LEFT OUTER JOIN "PrimaryGeneralLiabilityExposure" as primary_general_liability_exposure on primary_general_liability_exposure."quoteDetailId" = "QuoteDetail".id
LEFT OUTER JOIN "ProjectPrimaryGeneralLiabilityExposure" as primary_project_general_liability_exposure on primary_project_general_liability_exposure."quoteDetailId" = "QuoteDetail".id
),

subcost as (
SELECT 

"exposureId",
SUM(payroll) as "Subcontracted Cost",
"quoteDetailId"
FROM public."ExcessGeneralLiabilityExpectedSubcontractedCost" LEFT OUTER JOIN "ExcessGeneralLiabilityExposure" on "ExcessGeneralLiabilityExposure".id = "ExcessGeneralLiabilityExpectedSubcontractedCost"."exposureId"
GROUP BY "exposureId", "quoteDetailId" 

UNION SELECT 
"exposureId",
SUM(payroll) as "Subcontracted Cost",
"quoteDetailId"
FROM public."PrimaryGeneralLiabilityExpectedSubcontractedCost" LEFT OUTER JOIN "PrimaryGeneralLiabilityExposure" on "PrimaryGeneralLiabilityExposure".id = "PrimaryGeneralLiabilityExpectedSubcontractedCost"."exposureId"
GROUP BY "exposureId", "quoteDetailId"
UNION SELECT 
"exposureId",
SUM(payroll) as "Subcontracted Cost",
"quoteDetailId"
FROM public."ProjectPrimaryGeneralLiabilityExpectedSubcontractedCost" LEFT OUTER JOIN "ProjectPrimaryGeneralLiabilityExposure" on "ProjectPrimaryGeneralLiabilityExposure".id = "ProjectPrimaryGeneralLiabilityExpectedSubcontractedCost"."exposureId"
GROUP BY "exposureId", "quoteDetailId"


), 

multi_submissions as (
  WITH ExcessAndPrimaryForSameEffectiveDate AS (
    SELECT
        "Policyholder"."id" AS "Policyholder ID",
        "Policyholder"."name",
        "Policy"."effectiveDate" AS "Policy Effective Date",
        COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PROJECT', 'EXCESS_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT') THEN "Policy"."id" END) AS "Excess Count",
        COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT') THEN "Policy"."id" END) AS "Primary Count"
    FROM
        "Policy"
    INNER JOIN "Policyholder" ON "Policy"."policyholderId" = "Policyholder"."id"
    INNER JOIN "Quote" ON "Policy"."selectedQuoteId" = "Quote"."id"
    WHERE
        "Quote"."status" <> 'DISCARDED'
        AND "Quote"."deletedAt" IS NULL
        AND "Policyholder"."deletedAt" IS NULL
        AND "Policy"."deletedAt" IS NULL
    GROUP BY
        "Policyholder"."id",
        "Policy"."effectiveDate",
        "Policyholder"."name"
    HAVING
        COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PROJECT', 'EXCESS_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT') THEN "Policy"."id" END) > 0
        AND COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT') THEN "Policy"."id" END) > 0
)
SELECT
    E."Policyholder ID",
    E."name",
    E."Policy Effective Date",
    S."Policy ID" AS "Policy ID",
    'true'::boolean AS "Multi Submission Flag"
FROM (
    SELECT
        "Policy"."id" AS "Policy ID",
        "Policy"."effectiveDate" AS "Policy Effective Date",
        "Policy"."policyholderId" AS "Policyholder ID",
        ROW_NUMBER() OVER (PARTITION BY "Policy"."policyholderId", "Policy"."effectiveDate" ORDER BY "Policy"."product") AS "RowNum"
    FROM
        "Policy"
    WHERE
        "Policy"."product" IN ('EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PROJECT', 'EXCESS_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT', 'PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT')
) AS S
INNER JOIN ExcessAndPrimaryForSameEffectiveDate AS E ON S."Policyholder ID" = E."Policyholder ID" AND S."Policy Effective Date" = E."Policy Effective Date"
WHERE
    S."RowNum" = 1

UNION ALL

SELECT
    E."Policyholder ID",
    E."name",
    E."Policy Effective Date",
    P."Policy ID" AS "Policy ID",
    'true'::boolean AS "Multi Submission Flag"
FROM (
    SELECT
        "Policy"."id" AS "Policy ID",
        "Policy"."effectiveDate" AS "Policy Effective Date",
        "Policy"."policyholderId" AS "Policyholder ID",
        ROW_NUMBER() OVER (PARTITION BY "Policy"."policyholderId", "Policy"."effectiveDate" ORDER BY "Policy"."product") AS "RowNum"
    FROM
        "Policy"
    WHERE
        "Policy"."product" IN ('PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT')
) AS P
INNER JOIN ExcessAndPrimaryForSameEffectiveDate AS E ON P."Policyholder ID" = E."Policyholder ID" AND P."Policy Effective Date" = E."Policy Effective Date"
WHERE
    P."RowNum" = 1
ORDER BY
    "Policyholder ID",
    "Policy Effective Date",
    "Policy ID"

),


endorsements as (
SELECT  
    pce."name" AS "Policy Name",
    NULL::TIMESTAMP AS "Submission Date",
    NULL::boolean AS "Uses Shepherd Compliance",
    NULL::boolean as "Uses Shepherd Savings",
    DATE(pce."effectiveDate") AS "Effective Date",
    -- CASE 
        -- WHEN pce."quoteId" = 'e9d353f0-38e6-46bf-bbe2-8920dc3c7ebc' THEN '2023-04-12'
    DATE(pce."effectiveDate") AS "Endorsement Effective Date",
    "Policy"."effectiveDate" AS "Policy Effective Date",
    "Policy"."expirationDate" AS "Policy Expiration Date",
    -- CASE 
        -- WHEN pce."quoteId" = 'e9d353f0-38e6-46bf-bbe2-8920dc3c7ebc' THEN '2023-04'
    to_char(pce."effectiveDate",'YYYY-MM') AS "Reporting Month",
    NULL::numeric AS "Duration (Months)",
    CAST("Policy"."product" as TEXT) as "Product",
    CASE
        WHEN "Policy"."programType" is null
        THEN'Contractor Practice' 
        ELSE "Policy"."programType"::varchar(255)
    END as "Program Type",
    brokerage."name" as "Brokerage",
    office."name" as "Office",
    otr."Region",
    broker."firstName" || ' ' || broker."lastName" as "Broker",
    assignee."firstName" || ' ' || assignee."lastName" AS "Assignee",
    COALESCE(xsgltier."riskTierFinal",0) 
    + COALESCE(pxsgltier."riskTierFinal",0) 
    + COALESCE(primary_project_general_libility_risk_tier."riskTierFinal", 0)  
    + COALESCE(primary_practice_general_libility_risk_tier."riskTierFinal", 0) as "Risk Tier",
    ph."state" as "State",
    'ISSUED' AS "Status",
    NULL AS "Declination Reason",
    pce."finalEndorsementPremium"::integer AS "Gross Written Premium",
    null::numeric as "GL GWP (Primary Only)",
    null::numeric as "Auto GWP (Primary Only)",
    null::numeric as "WC GWP (Primary Only)",
    pce."shepherdMgaFee"::numeric AS "Shepherd Underwriting Fee",
    pce."brokerCommission"::numeric AS "Broker Commission",
    pce."shepherdMgaFee"::numeric + pce."brokerCommission"::numeric AS "Revenue",
    NULL::numeric AS "Sales or CV",
    NULL::numeric AS "Payroll",
    NULL::numeric AS "Fleet Size",
    coalesce(pce."finalEndorsementPremium"::integer * (1 - qp."totalExpenseLoadPercentage"),0
        ) / (COALESCE(qp."finalPricingAdequacy", 0) + COALESCE(primary_pricing_data."totalPricingAdequacy",0)) as "Benchmark",
    coalesce(pce."finalEndorsementPremium"::integer * (1 - qp."totalExpenseLoadPercentage"),0) as "Selected",
    pce."profitLoadFee"::numeric AS "Profit Load",
    pce."profitLoadFeePercentage"::numeric AS "Profit Load Percentage",
    NULL::numeric AS "PPM",
    COALESCE(qp."finalPricingAdequacy", 0) + COALESCE(primary_pricing_data."totalPricingAdequacy",0) as "Pricing Adequacy",
    NULL::numeric AS "GL Attachment",
    NULL::numeric AS "AL Attachment",
    NULL::numeric AS "Limit",
    null::numeric as "Underlying Limit",
    null::numeric as "Underlying Premium",
    NULL::text AS "Umbrella or Excess",
    CAST(qp."premiumClass" as text) as "Premium Class",
    qp."portfolioClass" AS "Portfolio Class",
    pce."brokerCommissionPercentage"::numeric*100 AS "Commission (%)",
    pce."shepherdMgaFeePercentage"::numeric*100 AS "Fee (%)",
    NULL::numeric AS "Auto Risk Tier",
    NULL::numeric AS "Quota Share",
    NULL::numeric AS "GL Experience Rating Factor",
    NULL::numeric AS "AL Experience Rating Factor",
    pce."totalExpenseLoadPercentage"::numeric AS "Total Expense Load Percentage",
    NULL::numeric AS "GL Manual Ratings",
    NULL::numeric as "GL Basic Limit Loss Costs",
    NULL::numeric AS "GL Selected Loss Cost",
    NULL::numeric AS "AL Selected Loss Cost",
    pce."premium"::numeric AS "Total Selected Loss Cost",
    NULL::numeric AS "Subcontracted Cost",
    pce."triaFeePercentage" AS "TRIA Fee Percentage",
    pce."employersLiabilityFeePercentage" as "Employer's Liability Fee Percentage",
    pce."triaFee" AS "TRIA Fee",
    NULL::numeric AS "Rate Change",
    NULL::numeric AS "GL Rate Change",
    NULL::numeric as "AL Rate Change",
    NULL::numeric AS "UW Impact Rate Change",
    NULL::text as "Parent Brokerage",
    NULL::boolean as "Referred to Treaty", 
    NULL::boolean as "Referred to Core",
    NULL::boolean AS "Procore Customer",
    NULL::boolean AS "OpenSpace Customer",
    NULL::boolean AS "Autodesk Customer",
    NULL::boolean AS "Samsara Customer",
    NULL::boolean AS "DroneDeploy Customer",
    NULL::boolean AS "Raken Customer",
    NULL::boolean AS "Procore Data Requested",
    NULL::boolean AS "Procore Data Uploaded",
    NULL::boolean AS "Openspace Data Requested",
    NULL::boolean AS "Autodesk Data Requested",
    NULL::text AS "Reason for Tech Data Absence",
    NULL::TIMESTAMP AS "Quoted Date",
    NULL::TIMESTAMP AS "Declined Date",
    NULL::TIMESTAMP AS "Quoted Lost Date",
    NULL AS "Quoted Lost Reason",
    NULL AS "Quoted Lost Notes",
    pce."issuedDate" AS "Issued Date",
    NULL::TIMESTAMP AS "Indicated Date",
    NULL::TIMESTAMP AS "Indicated Lost Date",
    NULL AS "Indicated Lost Reason",
    '0001-01-01 00:00:00'::TIMESTAMP  as "Updated Date",
   '0001-01-01 00:00:00'::TIMESTAMP  as "Blocked Time",
    null::numeric as "Time to Indicate (Hrs)",
    null::text as "TTI < 24h",
    null::text as "Predominant Class Code",
    null::numeric as "PRIVATE_PASSENGER_TYPE",
    null::numeric as "LIGHT_TRUCK",
    null::numeric as "MEDIUM_TRUCK",
    null::numeric as "HEAVY_TRUCK",
    null::numeric as "EXTRA_HEAVY_TRUCK",
    null::numeric as "HEAVY_TRUCK_TRACTOR",
    null::numeric as "EXTRA_HEAVY_TRUCK_TRACTOR",
    null::numeric as "SEMI_TRAILER",
    null::numeric as "SERVICE_OR_UTILITY_TRAILER",
    null::numeric as "TRAILERS",
    null::numeric as "Power Units Count",
    null::text as "Revenue Cohort",
    null::text as "Contractor Cohort",
    null::text as "Risk Cohort",
    'false'::boolean as "Multi Submission Flag",
    pce."quoteId"::uuid AS "quoteId"
    ,  null::numeric as "totalBasicLimitLossCostsAuto"
    ,  null::numeric as "lossDevelopmentLossPickAutoLiability"
    ,  null::numeric as "lossDevelopmentCredibilityAutoLiability"
    ,  null::numeric as "credibilityWeightedLossCostsAutoLiability"
    ,  null::numeric as "totalBasicLimitLossCostsGeneralLiability"
    ,  null::numeric as "lossDevelopmentLossPickGeneralLiability"
    ,  null::numeric as "lossDevelopmentCredibilityGeneralLiability"
    ,  null::numeric as "credibilityWeightedLossCostsGeneralLiability"
FROM public."PolicyChangeEndorsement" as pce
LEFT JOIN "Policy" on pce."quoteId" = "Policy"."selectedQuoteId"
LEFT JOIN "Policyholder" ph on "Policy"."policyholderId" = ph."id"
LEFT JOIN "User" assignee on "Policy"."assigneeId" = assignee."id"
LEFT JOIN "OrganizationMember" om on "Policy"."brokerOrganizationMemberId" = om."id"
LEFT JOIN "User" broker on om."userId" = broker."id"
LEFT JOIN "OrganizationLocation" office on om."organizationLocationId"= office."id"
LEFT JOIN "Organization" brokerage ON "Policy"."brokerageId" = brokerage."id"
LEFT JOIN "QuoteDetail" qd ON qd."quoteId" = pce."quoteId"
LEFT JOIN "ExcessGeneralLiabilityExposure" as xsglexp ON xsglexp."quoteDetailId"= qd.id
LEFT JOIN "PrimaryGeneralLiabilityExposure" as primary_practice_general_liability_exposure on primary_practice_general_liability_exposure."quoteDetailId"= qd.id
LEFT JOIN "ExcessGeneralLiabilityRiskTier" as xsgltier ON xsgltier."exposureId"= xsglexp.id
LEFT JOIN "ProjectExcessGeneralLiabilityExposure" as pxsglexp ON pxsglexp."quoteDetailId" = qd.id
LEFT JOIN "ProjectPrimaryGeneralLiabilityExposure" as primary_project_general_liability_exposure on primary_project_general_liability_exposure."quoteDetailId" = qd.id
LEFT JOIN "ProjectExcessGeneralLiabilityRiskTier" as pxsgltier ON pxsgltier."exposureId"= pxsglexp.id
LEFT JOIN "ProjectPrimaryGeneralLiabilityRiskTier" as primary_project_general_libility_risk_tier on primary_project_general_libility_risk_tier."exposureId" = primary_project_general_liability_exposure.id
LEFT JOIN "PrimaryGeneralLiabilityRiskTier" as primary_practice_general_libility_risk_tier on primary_practice_general_libility_risk_tier."exposureId" = primary_practice_general_liability_exposure.id
LEFT JOIN "QuotePricing" qp ON qp."quoteDetailId" = qd.id
LEFT JOIN "primary_pricing_data" as primary_pricing_data ON primary_pricing_data."quoteDetailId" = qd.id
LEFT JOIN benchmark ON benchmark.id = qd.id 
left join {{#1948-office-to-region}} otr on office.name = otr."Office" 
),

tech_usage_recency AS (
SELECT
    id,
    "policyholderId",
    "source",
    "techPartner",
    "status",
    "createdAt",
    "updatedAt",
    "adoptionDate",
    "cancelationDate",
    ROW_NUMBER() OVER (PARTITION BY "policyholderId", "techPartner" ORDER BY "createdAt" DESC) AS row_num
FROM "TechUsage"
WHERE 
  (status = 'ACTIVE' or status = 'INACTIVE')
ORDER BY "techPartner" DESC, "createdAt" DESC
),

active_tech_usage as (
SELECT
  r."id",
  r."policyholderId",
  p."name",
  r."source",
  r."techPartner",
  r."status",
  r."createdAt",
  r."updatedAt",
  r."adoptionDate",
  r."cancelationDate"
FROM tech_usage_recency as r
INNER JOIN "Policyholder" as p on p.id = r."policyholderId"
WHERE row_num = 1 AND status = 'ACTIVE'
),

active_tech_usage_single_row as (
select 
    p.id,
    p.name,
    (procore."techPartner" is not null) as "Procore Customer",
    (openspace."techPartner" is not null) as "OpenSpace Customer",
    (samsara."techPartner" is not null) as "Samsara Customer",
    (autodesk."techPartner" is not null) as "Autodesk Customer",
    (dronedeploy."techPartner" is not null) as "DroneDeploy Customer",
    (raken."techPartner" is not null) as "Raken Customer"
from 
    "Policyholder" as p
    left join active_tech_usage as procore on (procore."policyholderId" = p.id AND procore."techPartner" = 'PROCORE')
    left join active_tech_usage as openspace on (openspace."policyholderId" = p.id AND openspace."techPartner" = 'OPENSPACE')
    left join active_tech_usage as samsara on (samsara."policyholderId" = p.id AND samsara."techPartner" = 'SAMSARA')
    left join active_tech_usage as autodesk on (autodesk."policyholderId" = p.id AND autodesk."techPartner" = 'AUTODESK')
    left join active_tech_usage as dronedeploy on (dronedeploy."policyholderId" = p.id AND dronedeploy."techPartner" = 'DRONEDEPLOY')
    left join active_tech_usage as raken on (raken."policyholderId" = p.id AND raken."techPartner" = 'RAKEN')

),


policy_level_report as (

SELECT DISTINCT ON ("Policy"."id") 
"Policy"."policyNumber" as "Policy Number"
,CAST("Policy"."businessType" as TEXT) as "Business Type"
,CAST("Policy"."businessType" as TEXT) as "Parent Policy Business Type"
, "Policyholder"."name" as "Insured"
, "Policy"."name" as "Policy Name"
, "Policy"."submissionAt" as "Submission Date"
, "Policyholder"."usesShepherdCompliance" as "Uses Shepherd Compliance"
, "Policyholder"."usesShepherdSavings" as "Uses Shepherd Savings"
, Date("Policy"."effectiveDate") as "Effective Date"
, null::date as "Endorsement Effective Date"
, Date("Policy"."effectiveDate") as "Policy Effective Date"
, "Policy"."expirationDate" as "Policy Expiration Date"
, to_char("Policy"."effectiveDate",'YYYY-MM') as "Reporting Month"
, (round(("Policy"."expirationDate" - "Policy"."effectiveDate")/30.417)) as "Duration (Months)"
, CAST("Policy"."product" as TEXT) as "Product"
, CASE
    WHEN "Policy"."programType" is null
    THEN'Contractor Practice' 
    ELSE "Policy"."programType"::varchar(255)
  END as "Program Type"
, brokerage."name" as "Brokerage"
, office."name" as "Office"
, otr."Region"
, broker."firstName" || ' ' || broker."lastName" as "Broker"
, assignee."firstName" || ' ' || assignee."lastName" as "Assignee"
, COALESCE(xsgltier."riskTierFinal",0) + COALESCE(pxsgltier."riskTierFinal",0) + COALESCE(primary_project_general_libility_risk_tier."riskTierFinal", 0)  + COALESCE(primary_practice_general_libility_risk_tier."riskTierFinal", 0) as "Risk Tier"
, "Policyholder"."state" as "State"
, CAST("Quote"."status" as text) as "Status"
, CAST("Quote"."declinedReason" as text) as "Declination Reason"
, (COALESCE(qp."finalPremium", 0) + COALESCE(primary_pricing_data."finalPremium", 0))::integer as "Gross Written Premium"
, primary_pricing_data."generalLiabilityTotalPolicyPremium" as "GL GWP (Primary Only)"
, primary_pricing_data."autoLiabilityTotalPolicyPremium"+primary_pricing_data."autoPhysDamTotalPolicyPremium" as "Auto GWP (Primary Only)"
, primary_pricing_data."workersCompensationTotalPolicyPremium" as "WC GWP (Primary Only)"
, COALESCE(qp."shepherdMgaFee", 0) + COALESCE(primary_pricing_data."shepherdFee", 0) as "Shepherd Underwriting Fee" 
, COALESCE(qp."brokerCommission", 0) + COALESCE(primary_pricing_data."brokerageCommission", 0) as "Broker Commission"
, COALESCE(qp."shepherdMgaFee", 0) + COALESCE(primary_pricing_data."shepherdFee", 0) + COALESCE(qp."brokerCommission",0) + COALESCE(primary_pricing_data."brokerageCommission", 0) as "Revenue"
, COALESCE(xsglexp."programVolume",0) + COALESCE(pxsglexp."programVolume",0) + COALESCE(primary_practice_general_liability_exposure."programVolume",0) + COALESCE(primary_project_general_liability_exposure."programVolume",0) as "Sales or CV"
, COALESCE(tpg."sum_payroll",0) + COALESCE(tpp."sum_payroll",0) + COALESCE(total_payroll_primary_project."sum_payroll",0) + COALESCE(total_payroll_primary_practice."sum_payroll",0) as "Payroll"
, COALESCE(excess_vehicles."count", 0) + COALESCE(primary_vehicles."count", 0) as "Fleet Size"
, coalesce(benchmark."Benchmark", 0) + coalesce(primary_pricing_data."totalBenchmarkPremium", 0) as "Benchmark"
, coalesce(qp."finalPremium" * (1 - qp."totalExpenseLoadPercentage"),0) + coalesce(primary_pricing_data."totalSelectedPremium", 0)  as "Selected"
, COALESCE(qp."profitLoadFee", 0) + COALESCE(primary_pricing_data."profitLoad", 0) as "Profit Load"
, COALESCE(qp."profitLoadFeePercentage", 0) + COALESCE(primary_pricing_data."totalProfitLoadPercentage", 0) as "Profit Load Percentage"
, qp."finalPricePerMillion" as "PPM"
, COALESCE(qp."finalPricingAdequacy", 0) + COALESCE(primary_pricing_data."totalPricingAdequacy",0) as "Pricing Adequacy"
, coalesce(xsglexp."attachmentPoint", pxsglexp."attachmentPoint") as "GL Attachment"
, xae."attachmentPoint" as "AL Attachment"
, COALESCE(limits."Limit", 0) as "Limit"
, qp."underlyingPolicyLimit" as "Underlying Limit"
, qp."underlyingPolicyPremium" as "Underlying Premium"
, CASE 
      WHEN qp."isLead" = TRUE THEN 'Umbrella'
      WHEN qp."isLead" = FALSE THEN 'Excess'
    END AS "Umbrella or Excess"
, CAST(qp."premiumClass" as text) as "Premium Class"
,  qp."portfolioClass" AS "Portfolio Class"
, COALESCE(((qp."brokerCommission" / qp."finalPremium")*100),0) + COALESCE(primary_pricing_data."totalBrokerageCommissionPercentage"*100,0) as "Commission (%)"
, COALESCE((qp."shepherdMgaFeePercentage"*100), 0) + COALESCE(primary_pricing_data."totalShepherdFeePercentage" * 100, 0) as "Fee (%)" 
, COALESCE(xstier."riskTierFinal", 0) + COALESCE(primary_auto_risk_tier."riskTierFinal", 0) as "Auto Risk Tier"
, qs."quotaShare" as "Quota Share"
, COALESCE(xsqp."experienceRatingFactorGeneralLiability",0) + COALESCE(general_liability_manual_premium."experienceMod",0) as "GL Experience Rating Factor"
, COALESCE(xsqp."experienceRatingFactorAuto",0) + COALESCE(auto_manual_premium."liabilityExperienceMod",0) as "AL Experience Rating Factor"
, COALESCE(qp."totalExpenseLoadPercentage",0) + COALESCE(primary_pricing_data."totalExpenseLoadPercentage",0) as "Total Expense Load Percentage"
, COALESCE(xsqp."finalTotalManualPremiumGeneralLiability",0) + COALESCE(pxsqp."finalTotalManualPremiumGeneralLiability",0) AS "GL Manual Ratings"
, COALESCE(xsqp."totalBasicLimitLossCostsGeneralLiability",0) + COALESCE(pxsqp."totalBasicLimitLossCostsGeneralLiability",0) AS "GL Basic Limit Loss Costs"
, COALESCE(xsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(pxsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(primary_pricing_data."generalLiabilitySelectedLossCost", 0) as "GL Selected Loss Cost"
, COALESCE(xsqp."excessLossCostAdjustmentAuto", 0) + COALESCE(primary_pricing_data."autoLiabilitySelectedLossCost", 0) as "AL Selected Loss Cost"
, COALESCE(xsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(pxsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(xsqp."excessLossCostAdjustmentAuto",0) + COALESCE(primary_pricing_data."totalSelectedLossCost",0) as "Total Selected Loss Cost"
, subcost."Subcontracted Cost"
, qp."triaFeePercentage" as "TRIA Fee Percentage"
, qp."employersLiabilityFeePercentage" as "Employer's Liability Fee Percentage"
, COALESCE(qp."triaFee", 0) + COALESCE(primary_pricing_data."triaCoverage",0) as "TRIA Fee"
, xsrp."payrollOverPowerUnitsIndicatedRateChange" as "Rate Change"
, xsrp."generalLiabilityRateOnPayrollYoY" as "GL Rate Change"
, xsrp."autoLiabilityRateOnPowerUnitsYoY" as "AL Rate Change"
, xsrp."uwImpactRateChange" as "UW Impact Rate Change"
, CASE 
    WHEN brokerage."parentOrganizationName" is not null THEN brokerage."parentOrganizationName"
    ELSE brokerage."name"
    END as "Parent Brokerage"
, "Quote"."referredToTreaty" as "Referral to Treaty"
, "Quote"."referredToCore" as "Referral to Core"
, atu."Procore Customer"
, atu."OpenSpace Customer"
, atu."Autodesk Customer"
, atu."Samsara Customer"
, atu."DroneDeploy Customer"
, atu."Raken Customer"
, "Quote"."procoreDataRequested" as "Procore Data Requested"
, CASE 
    WHEN procore.id is not null THEN true
    ELSE false 
    END AS "Procore Data Uploaded" 
, "Quote"."openspaceDataRequested" as "Openspace Data Requested"
, "Quote"."autodeskDataRequested" as "Autodesk Data Requested"
, "Quote"."reasonForTechDataAbsence"::text as "Reason for Tech Data Absence"
,"Quote"."quotedAt" as "Quoted Date"
,"Quote"."declinedAt" as "Declined Date"
,"Quote"."quotedLostAt" as "Quoted Lost Date"
,"Quote"."quotedLostReason"::text as "Quoted Lost Reason"
,"Quote"."quotedLostNotes"::text as "Quoted Lost Notes"
,"Quote"."issuedAt" as "Issued Date"
,"Quote"."indicatedAt" as "Indicated Date"
,"Quote"."indicatedLostAt" as "Indicated Lost Date"
,"Quote"."indicatedLostReason"::text as "Indicated Lost Reason" 
,"Quote"."updatedAt" as "Updated Date"
,"Quote"."blockedAt" as "Blocked Time"
, CASE
    WHEN "Policy"."businessType" = 'RENEWAL' then null
    ELSE "Quote"."timeToIndicated" 
    END as "Time to Indicate (Hrs)"
, CASE 
    WHEN "Policy"."businessType" = 'RENEWAL' then ''
    WHEN "Quote"."status" = 'BLOCKED' then 'BLOCKED'
    WHEN "Quote"."blockedAt" IS NOT null then 'BLOCKED'
    WHEN "Quote"."timeToIndicated" <= 24 then 'SUCCESS'
    ELSE 'FAILED' END AS "TTI < 24h"
, concat(hicg."isoClass",hicp."isoClass",highest_iso_class_primary_project."isoClass", highest_iso_class_primary_practice."isoClass") as "Predominant Class Code"
, sv."PRIVATE_PASSENGER_TYPE"
, sv."LIGHT_TRUCK"
, sv."MEDIUM_TRUCK"
, sv."HEAVY_TRUCK"
, sv."EXTRA_HEAVY_TRUCK"
, sv."HEAVY_TRUCK_TRACTOR"
, sv."EXTRA_HEAVY_TRUCK_TRACTOR"
, sv."SEMI_TRAILER"
, sv."SERVICE_OR_UTILITY_TRAILER"
, sv."TRAILERS"
, (sv."PRIVATE_PASSENGER_TYPE"+sv."LIGHT_TRUCK"+sv."MEDIUM_TRUCK"+sv."HEAVY_TRUCK"+sv."EXTRA_HEAVY_TRUCK"+sv."HEAVY_TRUCK_TRACTOR"+sv."EXTRA_HEAVY_TRUCK_TRACTOR") AS "Power Units Count"
, CASE 
    WHEN COALESCE(xsglexp."programVolume",0) >0 AND COALESCE(xsglexp."programVolume",0) < 300000000 THEN '< $300M' 
    WHEN COALESCE(xsglexp."programVolume",0) >= 300000000 AND COALESCE(xsglexp."programVolume",0) < 1000000000 THEN '$300M to < $1B' 
    WHEN COALESCE(xsglexp."programVolume",0) >= 1000000000 THEN '$1B+' 
    END AS "Revenue Cohort"
, CASE
    WHEN COALESCE(xsglexp."programVolume",0) >= 1000000000 THEN ''
    WHEN subcost."Subcontracted Cost"/xsglexp."programVolume" >= 0.5 THEN 'General Contractor'
    WHEN substring(hicg."isoClass",1,3) = 'ISO' THEN 'Trade Contractor'
    END AS "Contractor Cohort"
, CASE 
    WHEN COALESCE(xsglexp."programVolume",0) >= 1000000000 THEN ''
    WHEN COALESCE(xsglexp."programVolume",0) <= 0 THEN ''
    WHEN COALESCE(xsgltier."riskTierFinal",0) BETWEEN 10 AND 30 THEN 'Low Risk' 
    WHEN COALESCE(xsgltier."riskTierFinal",0) >= 40  THEN 'High Risk' 
    END AS "Risk Cohort"
    , CASE 
    WHEN ms."Multi Submission Flag" = 'true' THEN 'true'::boolean
    ELSE 'false'::boolean
    END AS "Multi Submission Flag"
, "Policy"."selectedQuoteId" as "quoteId"
, xsqp."totalBasicLimitLossCostsAuto"
, xsqp."lossDevelopmentLossPickAutoLiability"
, xsqp."lossDevelopmentCredibilityAutoLiability"
, xsqp."credibilityWeightedLossCostsAutoLiability"
, xsqp."totalBasicLimitLossCostsGeneralLiability"
, xsqp."lossDevelopmentLossPickGeneralLiability"
, xsqp."lossDevelopmentCredibilityGeneralLiability"
, xsqp."credibilityWeightedLossCostsGeneralLiability"
FROM "Policy"
LEFT OUTER JOIN "OrganizationMember" om on "Policy"."brokerOrganizationMemberId" = om."id"
LEFT OUTER JOIN "User" broker on om."userId" = broker."id"
LEFT OUTER JOIN "OrganizationLocation" office on om."organizationLocationId"= office."id"
LEFT OUTER JOIN "Organization" brokerage ON "Policy"."brokerageId" = brokerage."id"
LEFT OUTER JOIN "User" assignee on "Policy"."assigneeId" = assignee."id"
LEFT OUTER JOIN "Policyholder"  on "Policy"."policyholderId" = "Policyholder"."id"
LEFT OUTER JOIN "Quote" ON "Policy"."selectedQuoteId" = "Quote"."id"
LEFT OUTER JOIN "QuoteDetail" qd ON qd."quoteId" = "Policy"."selectedQuoteId"
LEFT OUTER JOIN "QuotePricing" qp ON qp."quoteDetailId" = qd.id
LEFT OUTER JOIN "PrimaryProjectFinalPricing" primary_project_final_pricing ON primary_project_final_pricing."quoteDetailId" = qd.id
LEFT OUTER JOIN "PrimaryPracticeFinalPricing" primary_practice_final_pricing ON primary_practice_final_pricing."quoteDetailId" = qd.id
LEFT OUTER JOIN "PrimaryNonAdmittedProjectFinalPricing" primary_non_admitted_project_final_pricing ON primary_non_admitted_project_final_pricing."quoteDetailId" = qd.id
LEFT OUTER JOIN "PrimaryIntermediatePricing" primary_intermediate_pricing ON primary_intermediate_pricing."quoteDetailId" = qd.id
LEFT OUTER JOIN "AutoManualPremium" auto_manual_premium ON auto_manual_premium.id = primary_intermediate_pricing."autoManualPremiumId"
LEFT OUTER JOIN "GeneralLiabilityManualPremium" general_liability_manual_premium ON general_liability_manual_premium.id = primary_intermediate_pricing."generalLiabilityManualPremiumId"
LEFT OUTER JOIN "primary_pricing_data" as primary_pricing_data ON primary_pricing_data."quoteDetailId" = qd.id
LEFT OUTER JOIN "ExcessAutoExposure" as xae ON qd.id= xae."quoteDetailId"
LEFT OUTER JOIN "PrimaryAutoExposure" as primary_auto_exposure on qd.id = primary_auto_exposure."quoteDetailId"
LEFT OUTER JOIN "ProjectPrimaryAutoExposure" as project_primary_auto_exposure on qd.id = primary_auto_exposure."quoteDetailId"
LEFT OUTER JOIN "ExcessAutoRiskTier" as xstier ON xstier."exposureId"= xae.id 
LEFT OUTER JOIN "PrimaryAutoRiskTier" as primary_auto_risk_tier ON primary_auto_risk_tier."exposureId" = primary_auto_exposure.id 
LEFT OUTER JOIN "ExcessGeneralLiabilityExposure" as xsglexp ON xsglexp."quoteDetailId"= qd.id
LEFT OUTER JOIN "PrimaryGeneralLiabilityExposure" as primary_practice_general_liability_exposure on primary_practice_general_liability_exposure."quoteDetailId"= qd.id
LEFT OUTER JOIN "ExcessGeneralLiabilityRiskTier" as xsgltier ON xsgltier."exposureId"= xsglexp.id
LEFT OUTER JOIN "ExcessQuotePricing" as xsqp ON xsqp."quotePricingId" = qp.id
LEFT OUTER JOIN "ProjectExcessQuotePricing" as pxsqp ON pxsqp."quotePricingId" = qp.id
LEFT OUTER JOIN "ExcessAdmittedPracticeFinalPricing" as xsafp_prac ON xsafp_prac."quotePricingId" = qp.id
LEFT OUTER JOIN "ExcessAdmittedProjectFinalPricing" as xsafp_proj ON xsafp_proj."quotePricingId" = qp.id
LEFT OUTER JOIN "ProjectExcessGeneralLiabilityExposure" as pxsglexp ON pxsglexp."quoteDetailId" = qd.id
LEFT OUTER JOIN "ProjectPrimaryGeneralLiabilityExposure" as primary_project_general_liability_exposure on primary_project_general_liability_exposure."quoteDetailId" = qd.id
LEFT OUTER JOIN "ProjectExcessGeneralLiabilityRiskTier" as pxsgltier ON pxsgltier."exposureId"= pxsglexp.id
LEFT OUTER JOIN "ProjectPrimaryGeneralLiabilityRiskTier" as primary_project_general_libility_risk_tier on primary_project_general_libility_risk_tier."exposureId" = primary_project_general_liability_exposure.id
LEFT OUTER JOIN "PrimaryGeneralLiabilityRiskTier" as primary_practice_general_libility_risk_tier on primary_practice_general_libility_risk_tier."exposureId" = primary_practice_general_liability_exposure.id
LEFT OUTER JOIN "ProcoreUsage" as procore ON "Policy"."policyholderId"= procore."policyholderId" 
LEFT OUTER JOIN "total_payroll_gl" as tpg on tpg."exposureId" = xsglexp.id
LEFT OUTER JOIN "total_payroll_proj" as tpp on tpp."exposureId" = pxsglexp.id
LEFT OUTER JOIN total_payroll_primary_practice on total_payroll_primary_practice."exposureId" = primary_practice_general_liability_exposure.id
LEFT OUTER JOIN total_payroll_primary_project on total_payroll_primary_project."exposureId" = primary_project_general_liability_exposure.id
LEFT OUTER JOIN excess_vehicles on excess_vehicles."exposureId" = xae.id
LEFT OUTER JOIN primary_vehicles on primary_vehicles."exposureId" = primary_auto_exposure.id
LEFT OUTER JOIN benchmark ON benchmark.id = qd.id 
LEFT OUTER JOIN limits ON limits.id = qd.id
LEFT OUTER JOIN "QuoteSelection" as qs on qs."quoteDetailId" = qd.id 
LEFT OUTER JOIN highest_iso_class_gl hicg ON xsglexp.id = hicg."exposureId"
LEFT OUTER JOIN highest_iso_class_proj hicp ON pxsglexp.id = hicp."exposureId"
LEFT OUTER JOIN highest_iso_class_primary_project on primary_project_general_liability_exposure.id = highest_iso_class_primary_project."exposureId"
LEFT OUTER JOIN highest_iso_class_primary_practice on primary_practice_general_liability_exposure.id = highest_iso_class_primary_practice."exposureId"
LEFT OUTER JOIN sum_vehicles as sv ON sv."quoteDetailId" = qd.id
LEFT OUTER JOIN subcost ON subcost."quoteDetailId" = qd.id
LEFT OUTER JOIN "ExcessRenewalPricing" as xsrp ON xsrp."quotePricingId" = qp."id"
LEFT OUTER JOIN multi_submissions as ms ON ms."Policy ID" = "Policy"."id"
left join active_tech_usage_single_row as atu on atu.id = "Policyholder".id
left join {{#1948-office-to-region}} otr on office.name = otr."Office" 

WHERE 
    "Quote"."status" <> 'DISCARDED' 
    AND "Quote"."deletedAt" IS null
    AND "Policyholder"."deletedAt" IS null
    AND "Policy"."deletedAt" IS null 
ORDER BY "Policy"."id", "Updated Date" DESC, qd."version" DESC
)


SELECT
    *
FROM 
    (SELECT 
        "Policy"."policyNumber" as "Policy Number",
        'ENDORSEMENT' as "Business Type",
        CAST("Policy"."businessType" as TEXT) AS "Parent Policy Business Type",
        "Policyholder"."name" as "Insured",
        endorsements.*
    FROM endorsements
    INNER JOIN public."Policy" ON "Policy"."selectedQuoteId"  = endorsements."quoteId"
    INNER JOIN public."Policyholder" ON "Policy"."policyholderId"="Policyholder"."id"
        ) 

AS endorsement_policies

UNION 

SELECT 
*
FROM 
    policy_level_report
