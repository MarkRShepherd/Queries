WITH total_payroll_gl as (
  SELECT 
  "exposureId", 
  SUM(payroll) as "sum_payroll"
  FROM public."ExcessGeneralLiabilityExpectedPayroll"
  GROUP  BY "exposureId"),
  
primary_pricing_data as (
  
SELECT
  "id"
, "finalPremium"
, "generalLiabilityTotalPolicyPremium"
, "autoLiabilityTotalPolicyPremium"
, "autoPhysDamTotalPolicyPremium"
, "workersCompensationTotalPolicyPremium"
, "shepherdFee"
, "brokerageCommission"
, "profitLoad"
, "generalLiabilityPricingAdequacy"
, "autoLiabilityPricingAdequacy"
, "autoPhysDamPricingAdequacy"
, "totalPricingAdequacy"
, "generalLiabilityInitialPremium"
, "autoLiabilityInitialPremium"
, "autoPhysDamInitialPremium"
, "totalInitialPremium"
, "generalLiabilitySelectedPremium"
, "autoLiabilitySelectedPremium"
, "autoPhysDamSelectedPremium"
, "totalSelectedPremium"
, "generalLiabilityBenchmarkPremium"
, "autoLiabilityBenchmarkPremium"
, "autoPhysDamBenchmarkPremium"
, "totalBenchmarkPremium"
, "triaCoverage"
, "quoteDetailId"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) AS "generalLiabilityProfitLoadPercentage"
, COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "autoLiabilityProfitLoadPercentage"
, COALESCE("autoPhysDamProfitLoadPercentage", 0) AS "autoPhysDamProfitLoadPercentage"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) + COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "totalProfitLoadPercentage"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) AS "generalLiabilityTotalExpenseLoad"
, COALESCE("autoLiabilityTotalExpenseLoad", 0) AS "autoLiabilityTotalExpenseLoad"
, COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "autoPhysDamTotalExpenseLoad"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "totalExpenseLoadPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) AS "generalLiabilityBrokerageCommissionPercentage"
, COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) AS "autoLiabilityBrokerageCommissionPercentage"
, COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "autoPhysDamBrokerageCommissionPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "totalBrokerageCommissionPercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) AS "generalLiabilityShepherdFeePercentage"
, COALESCE("autoLiabilityShepherdFeePercentage", 0) AS "autoLiabilityShepherdFeePercentage"
, COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "autoPhysDamShepherdFeePercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "totalShepherdFeePercentage"
, "generalLiabilityAdjustedLossPick" AS "generalLiabilityRiskTransferLossCost"
, "autoLiabilityAdjustedLossPick" AS "autoLiabilityRiskTransferLossCost"
, "autoPhysDamAdjustedLossPick" AS "autoPhysDamRiskTransferLossCost"
, "generalLiabilityScheduleLossAdjustedLossPickDeductibleLayer" AS "generalLiabilitySelectedLossCost"
, "autoLiabilityScheduleLossAdjustedLossPickDeductibleLayer" AS "autoLiabilitySelectedLossCost"
, "autoPhysDamScheduleLossAdjustedLossPickDeductibleLayer" AS "autoPhysDamSelectedLossCost"
, "totalScheduleLossAdjustedLossPickDeductibleLayer" AS "totalSelectedLossCost"
, "totalTpaClaimsHandlingCharge"
, "totalTpaChargesNonClaimsHandling"
, "totalBadDebtCharge"
, "totalLossAggregateCharge"
, "generalLiabilityCharges"
, "autoLiabilityCharges"
, "autoPhysDamCharges"
from 
  "PrimaryProjectFinalPricing" 
  
UNION 

SELECT
  "id"
, "finalPremium"
, "generalLiabilityTotalPolicyPremium"
, "autoLiabilityTotalPolicyPremium"
, "autoPhysDamTotalPolicyPremium"
, "workersCompensationTotalPolicyPremium"
, "shepherdFee"
, "brokerageCommission"
, "profitLoad"
, "generalLiabilityPricingAdequacy"
, "autoLiabilityPricingAdequacy"
, "autoPhysDamPricingAdequacy"
, "totalPricingAdequacy"
, "generalLiabilityInitialPremium"
, "autoLiabilityInitialPremium"
, "autoPhysDamInitialPremium"
, "totalInitialPremium"
, "generalLiabilitySelectedPremium"
, "autoLiabilitySelectedPremium"
, "autoPhysDamSelectedPremium"
, "totalSelectedPremium"
, "generalLiabilityBenchmarkPremium"
, "autoLiabilityBenchmarkPremium"
, "autoPhysDamBenchmarkPremium"
, "totalBenchmarkPremium"
, "triaCoverage"
, "quoteDetailId"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) AS "generalLiabilityProfitLoadPercentage"
, COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "autoLiabilityProfitLoadPercentage"
, COALESCE("autoPhysDamProfitLoadPercentage", 0) AS "autoPhysDamProfitLoadPercentage"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) + COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "totalProfitLoadPercentage"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) AS "generalLiabilityTotalExpenseLoad"
, COALESCE("autoLiabilityTotalExpenseLoad", 0) AS "autoLiabilityTotalExpenseLoad"
, COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "autoPhysDamTotalExpenseLoad"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "totalExpenseLoadPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) AS "generalLiabilityBrokerageCommissionPercentage"
, COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) AS "autoLiabilityBrokerageCommissionPercentage"
, COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "autoPhysDamBrokerageCommissionPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "totalBrokerageCommissionPercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) AS "generalLiabilityShepherdFeePercentage"
, COALESCE("autoLiabilityShepherdFeePercentage", 0) AS "autoLiabilityShepherdFeePercentage"
, COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "autoPhysDamShepherdFeePercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "totalShepherdFeePercentage"
, "generalLiabilityAdjustedLossPick" AS "generalLiabilityRiskTransferLossCost"
, "autoLiabilityAdjustedLossPick" AS "autoLiabilityRiskTransferLossCost"
, "autoPhysDamAdjustedLossPick" AS "autoPhysDamRiskTransferLossCost"
, "generalLiabilityLossPickExcessOfDeductible" AS "generalLiabilitySelectedLossCost"
, "autoLiabilityLossPickExcessOfDeductible" AS "autoLiabilitySelectedLossCost"
, "autoPhysDamLossPickExcessOfDeductible" AS "autoPhysDamSelectedLossCost"
, "totalLossPickExcessOfDeductible" AS "totalSelectedLossCost"
, "totalTpaClaimsHandlingCharge"
, "totalTpaChargesNonClaimsHandling"
, "totalBadDebtCharge"
, "totalLossAggregateCharge"
, "generalLiabilityCharges"
, "autoLiabilityCharges"
, "autoPhysDamCharges"
from
  "PrimaryPracticeFinalPricing" 
  
UNION 

SELECT
  "id"
, "finalPremium"
, "generalLiabilityTotalPolicyPremium"
, "autoLiabilityTotalPolicyPremium"
, "autoPhysDamTotalPolicyPremium"
, "workersCompensationTotalPolicyPremium"
, "shepherdFee"
, "brokerageCommission"
, "profitLoad"
, "generalLiabilityPricingAdequacy"
, "autoLiabilityPricingAdequacy"
, "autoPhysDamPricingAdequacy"
, "totalPricingAdequacy"
, "generalLiabilityInitialPremium"
, "autoLiabilityInitialPremium"
, "autoPhysDamInitialPremium"
, "totalInitialPremium"
, "generalLiabilitySelectedPremium"
, "autoLiabilitySelectedPremium"
, "autoPhysDamSelectedPremium"
, "totalSelectedPremium"
, "generalLiabilityBenchmarkPremium"
, "autoLiabilityBenchmarkPremium"
, "autoPhysDamBenchmarkPremium"
, "totalBenchmarkPremium"
, "triaCoverage"
, "quoteDetailId"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) AS "generalLiabilityProfitLoadPercentage"
, COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "autoLiabilityProfitLoadPercentage"
, COALESCE("autoPhysDamProfitLoadPercentage", 0) AS "autoPhysDamProfitLoadPercentage"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) + COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "totalProfitLoadPercentage"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) AS "generalLiabilityTotalExpenseLoad"
, COALESCE("autoLiabilityTotalExpenseLoad", 0) AS "autoLiabilityTotalExpenseLoad"
, COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "autoPhysDamTotalExpenseLoad"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "totalExpenseLoadPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) AS "generalLiabilityBrokerageCommissionPercentage"
, COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) AS "autoLiabilityBrokerageCommissionPercentage"
, COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "autoPhysDamBrokerageCommissionPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "totalBrokerageCommissionPercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) AS "generalLiabilityShepherdFeePercentage"
, COALESCE("autoLiabilityShepherdFeePercentage", 0) AS "autoLiabilityShepherdFeePercentage"
, COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "autoPhysDamShepherdFeePercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "totalShepherdFeePercentage"
, "generalLiabilityAdjustedLossPick" AS "generalLiabilityRiskTransferLossCost"
, "autoLiabilityAdjustedLossPick" AS "autoLiabilityRiskTransferLossCost"
, "autoPhysDamAdjustedLossPick" AS "autoPhysDamRiskTransferLossCost"
, "generalLiabilityLossPickExcessOfDeductible" AS "generalLiabilitySelectedLossCost"
, "autoLiabilityLossPickExcessOfDeductible" AS "autoLiabilitySelectedLossCost"
, "autoPhysDamLossPickExcessOfDeductible" AS "autoPhysDamSelectedLossCost"
, "totalLossPickExcessOfDeductible" AS "totalSelectedLossCost"
, "totalTpaClaimsHandlingCharge"
, "totalTpaChargesNonClaimsHandling"
, "totalBadDebtCharge"
, "totalLossAggregateCharge"
, "generalLiabilityCharges"
, "autoLiabilityCharges"
, "autoPhysDamCharges"
from 
  "PrimaryNonAdmittedPracticeFinalPricing" 

UNION 

SELECT
  "id"
, "finalPremium"
, "generalLiabilityTotalPolicyPremium"
, "autoLiabilityTotalPolicyPremium"
, "autoPhysDamTotalPolicyPremium"
, "workersCompensationTotalPolicyPremium"
, "shepherdFee"
, "brokerageCommission"
, "profitLoad"
, "generalLiabilityPricingAdequacy"
, "autoLiabilityPricingAdequacy"
, "autoPhysDamPricingAdequacy"
, "totalPricingAdequacy"
, "generalLiabilityInitialPremium"
, "autoLiabilityInitialPremium"
, "autoPhysDamInitialPremium"
, "totalInitialPremium"
, "generalLiabilitySelectedPremium"
, "autoLiabilitySelectedPremium"
, "autoPhysDamSelectedPremium"
, "totalSelectedPremium"
, "generalLiabilityBenchmarkPremium"
, "autoLiabilityBenchmarkPremium"
, "autoPhysDamBenchmarkPremium"
, "totalBenchmarkPremium"
, "triaCoverage"
, "quoteDetailId"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) AS "generalLiabilityProfitLoadPercentage"
, COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "autoLiabilityProfitLoadPercentage"
, COALESCE("autoPhysDamProfitLoadPercentage", 0) AS "autoPhysDamProfitLoadPercentage"
, COALESCE("generalLiabilityProfitLoadPercentage", 0) + COALESCE("autoLiabilityProfitLoadPercentage", 0) AS "totalProfitLoadPercentage"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) AS "generalLiabilityTotalExpenseLoad"
, COALESCE("autoLiabilityTotalExpenseLoad", 0) AS "autoLiabilityTotalExpenseLoad"
, COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "autoPhysDamTotalExpenseLoad"
, COALESCE("generalLiabilityTotalExpenseLoad", 0) + COALESCE("autoLiabilityTotalExpenseLoad", 0) + COALESCE("autoPhysDamTotalExpenseLoad", 0) AS "totalExpenseLoadPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) AS "generalLiabilityBrokerageCommissionPercentage"
, COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) AS "autoLiabilityBrokerageCommissionPercentage"
, COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "autoPhysDamBrokerageCommissionPercentage"
, COALESCE("generalLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoLiabilityBrokerageCommissionPercentage", 0) + COALESCE("autoPhysDamBrokerageCommissionPercentage", 0) AS "totalBrokerageCommissionPercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) AS "generalLiabilityShepherdFeePercentage"
, COALESCE("autoLiabilityShepherdFeePercentage", 0) AS "autoLiabilityShepherdFeePercentage"
, COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "autoPhysDamShepherdFeePercentage"
, COALESCE("generalLiabilityShepherdFeePercentage", 0) + COALESCE("autoLiabilityShepherdFeePercentage", 0) + COALESCE("autoPhysDamShepherdFeePercentage", 0) AS "totalShepherdFeePercentage"
, "generalLiabilityAdjustedLossPick" AS "generalLiabilityRiskTransferLossCost"
, "autoLiabilityAdjustedLossPick" AS "autoLiabilityRiskTransferLossCost"
, "autoPhysDamAdjustedLossPick" AS "autoPhysDamRiskTransferLossCost"
, "generalLiabilityScheduleLossAdjustedLossPickDeductibleLayer" AS "generalLiabilitySelectedLossCost"
, "autoLiabilityScheduleLossAdjustedLossPickDeductibleLayer" AS "autoLiabilitySelectedLossCost"
, "autoPhysDamScheduleLossAdjustedLossPickDeductibleLayer" AS "autoPhysDamSelectedLossCost"
, "totalScheduleLossAdjustedLossPickDeductibleLayer" AS "totalSelectedLossCost"
, "totalTpaClaimsHandlingCharge"
, "totalTpaChargesNonClaimsHandling"
, "totalBadDebtCharge"
, "totalLossAggregateCharge"
, "generalLiabilityCharges"
, "autoLiabilityCharges"
, "autoPhysDamCharges"
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
, CASE 
    WHEN (qs."quotaShare" < '1') THEN coalesce((xqp."totalExcessBenchmarkLossCost"*qs."quotaShare"),(pxqp."totalExcessBenchmarkLossCost"*qs."quotaShare"))
    ELSE coalesce(xqp."totalExcessBenchmarkLossCost", pxqp."totalExcessBenchmarkLossCost") 
    END AS "Benchmark" 
FROM "QuoteDetail"
LEFT OUTER JOIN "QuotePricing" qp ON qp."quoteDetailId" = "QuoteDetail".id
LEFT OUTER JOIN "QuoteSelection" as qs on qs."quoteDetailId" = "QuoteDetail".id 
LEFT OUTER JOIN "ExcessQuotePricing" as xqp ON xqp."quotePricingId"= qp.id
LEFT OUTER JOIN "ProjectExcessQuotePricing" as pxqp ON pxqp."quotePricingId"= qp.id
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
      "exposureId"
    , "quoteDetailId"
    , SUM(CASE "sizeClass" WHEN 'PRIVATE_PASSENGER_TYPE' THEN vehicle_count ELSE 0 END) AS "PRIVATE_PASSENGER_TYPE"
    , SUM(CASE "sizeClass" WHEN 'LIGHT_TRUCK' THEN vehicle_count ELSE 0 END) AS "LIGHT_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'MEDIUM_TRUCK' THEN vehicle_count ELSE 0 END) AS "MEDIUM_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK_TRACTOR"
    , SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK_TRACTOR"
    , SUM(CASE "sizeClass" WHEN 'SEMI_TRAILER' THEN vehicle_count ELSE 0 END) AS "SEMI_TRAILER"
    , SUM(CASE "sizeClass" WHEN 'SERVICE_OR_UTILITY_TRAILER' THEN vehicle_count ELSE 0 END) AS "SERVICE_OR_UTILITY_TRAILER"
    , SUM(CASE "sizeClass" WHEN 'TRAILERS' THEN vehicle_count ELSE 0 END) AS "TRAILERS"
from 
	grouped_excess_vehicles_by_size_class as gev
	LEFT OUTER JOIN "ExcessAutoExposure" on "ExcessAutoExposure".id = gev."exposureId"
-- where "exposureId" = '442bb519-d801-4e6e-b464-0f3738474641'  
GROUP BY "exposureId", "quoteDetailId"
),

formatted_primary_vehicles_by_size_class as (
select 
      "exposureId"
    , "quoteDetailId"
    , SUM(CASE "sizeClass" WHEN 'PRIVATE_PASSENGER_TYPE' THEN vehicle_count ELSE 0 END) AS "PRIVATE_PASSENGER_TYPE"
    , SUM(CASE "sizeClass" WHEN 'LIGHT_TRUCK' THEN vehicle_count ELSE 0 END) AS "LIGHT_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'MEDIUM_TRUCK' THEN vehicle_count ELSE 0 END) AS "MEDIUM_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK"
    , SUM(CASE "sizeClass" WHEN 'HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "HEAVY_TRUCK_TRACTOR"
    , SUM(CASE "sizeClass" WHEN 'EXTRA_HEAVY_TRUCK_TRACTOR' THEN vehicle_count ELSE 0 END) AS "EXTRA_HEAVY_TRUCK_TRACTOR"
    , SUM(CASE "sizeClass" WHEN 'SEMI_TRAILER' THEN vehicle_count ELSE 0 END) AS "SEMI_TRAILER"
    , SUM(CASE "sizeClass" WHEN 'SERVICE_OR_UTILITY_TRAILER' THEN vehicle_count ELSE 0 END) AS "SERVICE_OR_UTILITY_TRAILER"
    , SUM(CASE "sizeClass" WHEN 'TRAILERS' THEN vehicle_count ELSE 0 END) AS "TRAILERS"
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
        "Policy"."effectiveDate" AS "Effective Date",
        COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('EXCESS_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT', 'EXCESS_NON_ADMITTED_PROJECT') THEN "Policy"."id" END) AS "Excess Count",
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
        COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('EXCESS_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT', 'EXCESS_NON_ADMITTED_PROJECT') THEN "Policy"."id" END) > 0
        AND COUNT(DISTINCT CASE WHEN "Policy"."product" IN ('PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT') THEN "Policy"."id" END) > 0
)
SELECT
    E."Policyholder ID",
    E."name",
    E."Effective Date",
    S."Policy ID" AS "Policy ID",
    'true'::boolean AS "Multi Submission Flag"
FROM (
    SELECT
        "Policy"."id" AS "Policy ID",
        "Policy"."effectiveDate" AS "Effective Date",
        "Policy"."policyholderId" AS "Policyholder ID",
        ROW_NUMBER() OVER (PARTITION BY "Policy"."policyholderId", "Policy"."effectiveDate" ORDER BY "Policy"."product") AS "RowNum"
    FROM
        "Policy"
    WHERE
        "Policy"."product" IN ('EXCESS_ADMITTED_PRACTICE', 'EXCESS_NON_ADMITTED_PRACTICE', 'EXCESS_ADMITTED_PROJECT', 'EXCESS_NON_ADMITTED_PROJECT', 'PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT')
) AS S
INNER JOIN ExcessAndPrimaryForSameEffectiveDate AS E ON S."Policyholder ID" = E."Policyholder ID" AND S."Effective Date" = E."Effective Date"
WHERE
    S."RowNum" = 1

UNION ALL

SELECT
    E."Policyholder ID",
    E."name",
    E."Effective Date",
    P."Policy ID" AS "Policy ID",
    'true'::boolean AS "Multi Submission Flag"
FROM (
    SELECT
        "Policy"."id" AS "Policy ID",
        "Policy"."effectiveDate" AS "Effective Date",
        "Policy"."policyholderId" AS "Policyholder ID",
        ROW_NUMBER() OVER (PARTITION BY "Policy"."policyholderId", "Policy"."effectiveDate" ORDER BY "Policy"."product") AS "RowNum"
    FROM
        "Policy"
    WHERE
        "Policy"."product" IN ('PRIMARY_NON_ADMITTED_PRACTICE', 'PRIMARY_NON_ADMITTED_PROJECT', 'PRIMARY_ADMITTED_PRACTICE', 'PRIMARY_ADMITTED_PROJECT')
) AS P
INNER JOIN ExcessAndPrimaryForSameEffectiveDate AS E ON P."Policyholder ID" = E."Policyholder ID" AND P."Effective Date" = E."Effective Date"
WHERE
    P."RowNum" = 1
ORDER BY
    "Policyholder ID",
    "Effective Date",
    "Policy ID"

),


endorsements as (
SELECT   
      pce."name" AS "Policy Name"
    , CASE 
        WHEN pce."quoteId" = 'e9d353f0-38e6-46bf-bbe2-8920dc3c7ebc' THEN '2023-04-12'
        ELSE DATE(pce."effectiveDate")
        END AS "Effective Date"
    , NULL::DATE AS "Expiration Date"
    , NULL::numeric AS "Duration (Months)"
    , CAST("Policy"."product" as TEXT) as "Product"
    , CASE
        WHEN "Policy"."programType" is null
        THEN 'Contractor Practice' 
        ELSE "Policy"."programType"::varchar(255)
        END as "Program Type"
    , NULL::numeric AS "Risk Tier"
    , ph."state" as "State"
    , 'ISSUED' AS "Status"
    , pce."finalEndorsementPremium"::numeric AS "Gross Written Premium"
    , null::numeric as "GL GWP (Primary Only)"
    , null::numeric as "AL GWP (Primary Only)"
    , null::numeric as "APD GWP (Primary Only)"
    , null::numeric as "WC GWP (Primary Only)"
    , NULL::numeric AS "Revenue"
    , NULL::numeric AS "Sales or CV"
    , NULL::numeric AS "Payroll"
    , NULL::numeric AS "Fleet Size"
    , NULL::numeric AS "Benchmark"
    , NULL::numeric AS "Selected"
    , NULL:: numeric As "GL Profit Load (%)" -- added
    , NULL:: numeric As "AL Profit Load (%)" -- added
    , NULL:: numeric As "APD Profit Load (%)" -- added
    , pce."profitLoadFeePercentage"::numeric AS "Profit Load Percentage"
    , NULL::numeric AS "GL Pricing Adequacy" -- added
    , NULL::numeric as "AL Pricing Adequacy" -- added
    , NULL::numeric as "APD Pricing Adequacy" -- added
    , NULL::numeric AS "Pricing Adequacy"
    , NULL::numeric AS "GL Initial Premium" -- added
    , NULL::numeric AS "AL Initial Premium" -- added
    , NULL::numeric AS "APD Initial Premium" -- added
    , NULL::numeric AS "Initial Premium" -- added
    , NULL::numeric AS "GL Selected Premium" -- added
    , NULL::numeric AS "AL Selected Premium" -- added
    , NULL::numeric AS "APD Selected Premium" -- added
    , NULL::numeric AS "Selected Premium" -- added
    , NULL::numeric AS "GL Benchmark Premium" -- added
    , NULL::numeric AS "AL Benchmark Premium" -- added
    , NULL::numeric AS "APD Benchmark Premium" -- added
    , NULL::numeric AS "Benchmark Premium" -- added
    , NULL::numeric AS "GL Attachment"
    , NULL::numeric AS "AL Attachment"
    , NULL::numeric AS "Limit"
    , NULL::text AS "Umbrella or Excess"
    , NULL::numeric AS "GL Commission (%)" -- added
    , NULL::numeric AS "AL Commission (%)" -- added
    , NULL::numeric AS "APD Commission (%)" -- added
    , pce."brokerCommissionPercentage"::numeric AS "Commission (%)"
    , NULL::numeric AS "GL Fee (%)"
    , NULL::numeric AS "AL Fee (%)"
    , NULL::numeric AS "APD Fee (%)"
    , pce."shepherdMgaFeePercentage"::numeric AS "Fee (%)"
    , NULL::numeric AS "TPA Claims Handling Charge" -- added
    , NULL::numeric AS "TPA Charge (Non-Claims Handling)" -- added
    , NULL::numeric AS "Total Bad Debt Charge" -- added
    , NULL::numeric AS "Total Loss Aggregate Charge" -- added
    , NULL::numeric AS "GL Charges" -- added
    , NULL::numeric AS "AL Charges" -- added
    , NULL::numeric AS "APD Charges" -- added
    , NULL::numeric AS "Auto Risk Tier" 
    , NULL::numeric AS "Quota Share" 
    , NULL::numeric AS "GL Experience Rating Factor"
    , NULL::numeric AS "AL Experience Rating Factor"
    , NULL::numeric AS "GL Expense Load (%)" -- added
    , NULL::numeric AS "AL Expense Load (%)" -- added
    , NULL::numeric AS "APD Expense Load (%)" -- added
    , pce."totalExpenseLoadPercentage"::numeric AS "Total Expense Load Percentage"
    , NULL::numeric AS "GL Manual Ratings"
    , NULL::numeric AS "GL Risk Transfer Loss Cost"
    , NULL::numeric AS "AL Risk Transfer Loss Cost"
    , NULL::numeric AS "APD Risk Transfer Loss Cost"    
    , NULL::numeric AS "GL Selected Loss Cost"
    , NULL::numeric AS "AL Selected Loss Cost"
    , NULL::numeric AS "APD Selected Loss Cost"
    , NULL::numeric AS "Subcontracted Cost"
    , pce."triaFeePercentage" AS "TRIA Fee Percentage"
    , pce."employersLiabilityFeePercentage" as "Employer's Liability Fee Percentage"
    , NULL::numeric as "Per Project Aggregate Charge"
    , NULL::numeric AS "Total Rate Change on Payroll and Power Units"
    , NULL::numeric as "Total Rate Change on Sales"
    , NULL::numeric AS "GL Rate Change on Payroll"
    , NULL::numeric as "AL Rate Change on Power Units"
    , NULL::numeric as "Total Premium Renewal Change"
    , NULL::numeric AS "UW Impact Rate Change"
    , null::text as "Predominant Class Code"
    , null::numeric as "PRIVATE_PASSENGER_TYPE"
    , null::numeric as "LIGHT_TRUCK"
    , null::numeric as "MEDIUM_TRUCK"
    , null::numeric as "HEAVY_TRUCK"
    , null::numeric as "EXTRA_HEAVY_TRUCK"
    , null::numeric as "HEAVY_TRUCK_TRACTOR"
    , null::numeric as "EXTRA_HEAVY_TRUCK_TRACTOR"
    , null::numeric as "SEMI_TRAILER"
    , null::numeric as "SERVICE_OR_UTILITY_TRAILER"
    , null::numeric as "TRAILERS"
    , null::numeric as "Power Units Count"
    , null::text as "Revenue Cohort"
    , null::text as "Contractor Cohort"
    , null::text as "Risk Cohort"
    ,  null::numeric as "totalBasicLimitLossCostsAuto"
    ,  null::numeric as "lossDevelopmentLossPickAutoLiability"
    ,  null::numeric as "lossDevelopmentCredibilityAutoLiability"
    ,  null::numeric as "credibilityWeightedLossCostsAutoLiability"
    ,  null::numeric as "totalBasicLimitLossCostsGeneralLiability"
    ,  null::numeric as "lossDevelopmentLossPickGeneralLiability"
    ,  null::numeric as "lossDevelopmentCredibilityGeneralLiability"
    ,  null::numeric as "credibilityWeightedLossCostsGeneralLiability"
    ,  NULL::boolean AS "Uses Shepherd Compliance"
    ,  NULL::boolean as "Uses Shepherd Savings"
    ,  NULL::boolean AS "Procore Customer"
    ,  NULL::boolean AS "OpenSpace Customer"
    ,  NULL::boolean AS "Autodesk Customer"
    ,  NULL::boolean AS "Samsara Customer"
    ,  NULL::boolean AS "DroneDeploy Customer"
    ,  NULL::boolean AS "Raken Customer"
    ,  pce."quoteId"::uuid AS "quoteId"
FROM public."PolicyChangeEndorsement" as pce
LEFT JOIN "Policy" on pce."quoteId" = "Policy"."selectedQuoteId"
LEFT JOIN "Policyholder" ph on "Policy"."policyholderId" = ph."id"
LEFT JOIN "User" assignee on "Policy"."assigneeId" = assignee."id"
LEFT JOIN "OrganizationMember" om on "Policy"."brokerOrganizationMemberId" = om."id"
LEFT JOIN "User" broker on om."userId" = broker."id"
LEFT JOIN "OrganizationLocation" office on om."organizationLocationId"= office."id"
LEFT JOIN "Organization" brokerage ON "Policy"."brokerageId" = brokerage."id"),

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
, CAST("Policy"."businessType" as TEXT) as "Business Type"
, "Policyholder"."name" as "Insured"
, "Policy"."name" as "Policy Name"
, Date("Policy"."effectiveDate") as "Effective Date"
, "Policy"."expirationDate" as "Expiration Date"
, (round(("Policy"."expirationDate" - "Policy"."effectiveDate")/30.417)) as "Duration (Months)"
, CAST("Policy"."product" as TEXT) as "Product"
, CASE
    WHEN "Policy"."programType" is null
    THEN'Contractor Practice' 
    ELSE "Policy"."programType"::varchar(255)
  END as "Program Type"
, COALESCE(xsgltier."riskTierFinal",0) + COALESCE(pxsgltier."riskTierFinal",0) + COALESCE(primary_project_general_libility_risk_tier."riskTierFinal", 0)  + COALESCE(primary_practice_general_libility_risk_tier."riskTierFinal", 0) as "Risk Tier"
, "Policyholder"."state" as "State"
, CAST("Quote"."status" as text) as "Status"
, COALESCE(qp."finalPremium", 0) + COALESCE(primary_pricing_data."finalPremium", 0) as "Gross Written Premium"

, COALESCE(primary_pricing_data."generalLiabilityTotalPolicyPremium",0) as "GL GWP (Primary Only)"
, COALESCE(primary_pricing_data."autoLiabilityTotalPolicyPremium",0) as "AL GWP (Primary Only)"
, COALESCE(primary_pricing_data."autoPhysDamTotalPolicyPremium",0) as "APD GWP (Primary Only)"
, COALESCE(primary_pricing_data."workersCompensationTotalPolicyPremium",0) as "WC GWP (Primary Only)"

, COALESCE(qp."shepherdMgaFee", 0) + COALESCE(primary_pricing_data."shepherdFee", 0) + COALESCE(qp."brokerCommission",0) + COALESCE(primary_pricing_data."brokerageCommission", 0) as "Revenue"
, COALESCE(xsglexp."programVolume",0) + COALESCE(pxsglexp."programVolume",0) + COALESCE(primary_practice_general_liability_exposure."programVolume",0) + COALESCE(primary_project_general_liability_exposure."programVolume",0) as "Sales or CV"
, COALESCE(tpg."sum_payroll",0) + COALESCE(tpp."sum_payroll",0) + COALESCE(total_payroll_primary_project."sum_payroll",0) + COALESCE(total_payroll_primary_practice."sum_payroll",0) as "Payroll"
, COALESCE(excess_vehicles."count", 0) + COALESCE(primary_vehicles."count", 0) as "Fleet Size"
, benchmark."Benchmark" as "Benchmark"
, qp."finalPremium" * (1 - qp."totalExpenseLoadPercentage") as "Selected"
, COALESCE(primary_pricing_data."generalLiabilityProfitLoadPercentage", 0) as "GL Profit Load (%)" -- added
, COALESCE(primary_pricing_data."autoLiabilityProfitLoadPercentage", 0) as "AL Profit Load (%)" -- added
, COALESCE(primary_pricing_data."autoPhysDamProfitLoadPercentage",0) as "APD Profit Load (%)" -- added
, COALESCE(qp."profitLoadFeePercentage", 0) + COALESCE(primary_pricing_data."totalProfitLoadPercentage", 0) as "Profit Load (%)"

, primary_pricing_data."generalLiabilityPricingAdequacy" as "GL Pricing Adequacy"
, primary_pricing_data."autoLiabilityPricingAdequacy" as "AL Pricing Adequacy"
, primary_pricing_data."autoPhysDamPricingAdequacy" as "APD Pricing Adequacy"
, COALESCE(qp."finalPricingAdequacy", 0) + COALESCE(primary_pricing_data."totalPricingAdequacy",0) as "Pricing Adequacy"

, COALESCE(primary_pricing_data."generalLiabilityInitialPremium",0) as "GL Initial Premium"
, COALESCE(primary_pricing_data."autoLiabilityInitialPremium",0) as "AL Initial Premium"
, COALESCE(primary_pricing_data."autoPhysDamInitialPremium",0) as "APD Initial Premium"
, COALESCE(primary_pricing_data."totalInitialPremium",0) as "Initial Premium"

, COALESCE(primary_pricing_data."generalLiabilitySelectedPremium",0) as "GL Selected Premium"
, COALESCE(primary_pricing_data."autoLiabilitySelectedPremium",0) as "AL Selected Premium"
, COALESCE(primary_pricing_data."autoPhysDamSelectedPremium",0) as "APD Selected Premium"
, COALESCE(primary_pricing_data."totalSelectedPremium",0) as "Selected Premium"

, COALESCE(primary_pricing_data."generalLiabilityBenchmarkPremium",0) as "GL Benchmark Premium"
, COALESCE(primary_pricing_data."autoLiabilityBenchmarkPremium",0) as "AL Benchmark Premium"
, COALESCE(primary_pricing_data."autoPhysDamBenchmarkPremium",0) as "APD Benchmark Premium"
, COALESCE(primary_pricing_data."totalBenchmarkPremium",0) as "Benchmark Premium"

, coalesce(xsglexp."attachmentPoint", pxsglexp."attachmentPoint") as "GL Attachment"
, xae."attachmentPoint" as "AL Attachment"
, COALESCE(limits."Limit", 0) as "Limit"
, CASE 
      WHEN qp."isLead" = TRUE THEN 'Umbrella'
      WHEN qp."isLead" = FALSE THEN 'Excess'
    END AS "Umbrella or Excess"
-- , CAST(qp."premiumClass" as text) as "Premium Class"
-- ,  qp."portfolioClass" AS "Portfolio Class"
, COALESCE(primary_pricing_data."generalLiabilityBrokerageCommissionPercentage") as "GL Commission (%)" -- added
, COALESCE(primary_pricing_data."autoLiabilityBrokerageCommissionPercentage") as "AL Commission (%)" -- added
, COALESCE(primary_pricing_data."autoPhysDamBrokerageCommissionPercentage") as "APD Commission (%)" -- added
, COALESCE((qp."brokerCommission" / qp."finalPremium"),0) + COALESCE(primary_pricing_data."totalBrokerageCommissionPercentage",0) as "Commission (%)"

, COALESCE(primary_pricing_data."generalLiabilityShepherdFeePercentage") as "GL Fee (%)" -- added
, COALESCE(primary_pricing_data."autoLiabilityShepherdFeePercentage") as "AL Fee (%)" -- added
, COALESCE(primary_pricing_data."autoPhysDamShepherdFeePercentage") as "APD Fee (%)" -- added
, COALESCE(qp."shepherdMgaFeePercentage", 0) + COALESCE(primary_pricing_data."totalShepherdFeePercentage", 0) as "Fee (%)" 

, COALESCE(primary_pricing_data."totalTpaClaimsHandlingCharge",0) as "TPA Claims Handling Charge"
, COALESCE(primary_pricing_data."totalTpaChargesNonClaimsHandling",0) as "TPA Charge (Non-Claims Handling)"
, COALESCE(primary_pricing_data."totalBadDebtCharge",0) as "Total Bad Debt Charge"
, COALESCE(primary_pricing_data."totalLossAggregateCharge",0) as "Total Loss Aggregate Charge"

, COALESCE(primary_pricing_data."generalLiabilityCharges",0) as "GL Charges" -- added
, COALESCE(primary_pricing_data."autoLiabilityCharges",0) as "AL Charges" -- added
, COALESCE(primary_pricing_data."autoPhysDamCharges",0) as "APD Charges" -- added

, COALESCE(xstier."riskTierFinal", 0) + COALESCE(primary_auto_risk_tier."riskTierFinal", 0) as "Auto Risk Tier"
, qs."quotaShare" as "Quota Share"
, COALESCE(xsqp."experienceRatingFactorGeneralLiability",0) + COALESCE(general_liability_manual_premium."experienceMod",0) as "GL Experience Rating Factor"
, COALESCE(xsqp."experienceRatingFactorAuto",0) + COALESCE(auto_manual_premium."liabilityExperienceMod",0) as "AL Experience Rating Factor"

, COALESCE(primary_pricing_data."generalLiabilityTotalExpenseLoad",0) as "GL Expense Load (%)" -- added
, COALESCE(primary_pricing_data."autoLiabilityTotalExpenseLoad",0) as "AL Expense Load (%)" -- added
, COALESCE(primary_pricing_data."autoPhysDamTotalExpenseLoad",0) as "APD Expense Load (%)" -- added
, COALESCE(qp."totalExpenseLoadPercentage",0) + COALESCE(primary_pricing_data."totalExpenseLoadPercentage",0) as "Total Expense Load (%)"

, COALESCE(xsqp."finalTotalManualPremiumGeneralLiability",0) + COALESCE(pxsqp."finalTotalManualPremiumGeneralLiability",0) AS "GL Manual Ratings"

, COALESCE(primary_pricing_data."generalLiabilityRiskTransferLossCost",0) as "GL Risk Transfer Loss Cost" -- added
, COALESCE(primary_pricing_data."autoLiabilityRiskTransferLossCost",0) as "AL Risk Transfer Loss Cost" -- added
, COALESCE(primary_pricing_data."autoPhysDamRiskTransferLossCost",0) as "APD Risk Transfer Loss Cost" -- added

, COALESCE(xsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(pxsqp."excessLossCostAdjustmentGeneralLiability",0) + COALESCE(primary_pricing_data."generalLiabilitySelectedLossCost", 0) as "GL Selected Loss Cost"
, COALESCE(xsqp."excessLossCostAdjustmentAuto", 0) + COALESCE(primary_pricing_data."autoLiabilitySelectedLossCost", 0) as "AL Selected Loss Cost"
, COALESCE(primary_pricing_data."autoPhysDamSelectedLossCost",0) as "APD Selected Loss Cost"

, subcost."Subcontracted Cost"
, qp."triaFeePercentage" as "TRIA Fee Percentage"
, qp."employersLiabilityFeePercentage" as "Employer's Liability Fee Percentage"
, COALESCE(xsqp."perProjectAggregateCharge",0) + COALESCE(pxsqp."perProjectAggregateCharge",0) + COALESCE(general_liability_manual_premium."projectGeneralAggregate",0) as "Per Project Aggregate Charge"
-- , COALESCE(qp."triaFee", 0) + COALESCE(primary_pricing_data."triaCoverage",0) as "TRIA Fee"
, xsrp."payrollOverPowerUnitsIndicatedRateChange" as "Total Rate Change on Payroll and Power Units"
, xsrp."totalRateChangeOnSales" as "Total Rate Change on Sales"
, xsrp."generalLiabilityRateOnPayrollYoY" as "GL Rate Change on Payroll"
, xsrp."autoLiabilityRateOnPowerUnitsYoY" as "AL Rate Change on Power Units"
, xsrp."netPremiumChange" as "Total Premium Renewal Change"
, xsrp."uwImpactRateChange" as "UW Impact Rate Change"
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
--     , CASE 
--     WHEN ms."Multi Submission Flag" = 'true' THEN 'true'::boolean
--     ELSE 'false'::boolean
--     END AS "Multi Submission Flag"
, xsqp."totalBasicLimitLossCostsAuto"
, xsqp."lossDevelopmentLossPickAutoLiability"
, xsqp."lossDevelopmentCredibilityAutoLiability"
, xsqp."credibilityWeightedLossCostsAutoLiability"
, xsqp."totalBasicLimitLossCostsGeneralLiability"
, xsqp."lossDevelopmentLossPickGeneralLiability"
, xsqp."lossDevelopmentCredibilityGeneralLiability"
, xsqp."credibilityWeightedLossCostsGeneralLiability"
, "Policyholder"."usesShepherdCompliance" as "Uses Shepherd Compliance"
, "Policyholder"."usesShepherdSavings" as "Uses Shepherd Savings"
, atu."Procore Customer"
, atu."OpenSpace Customer"
, atu."Autodesk Customer"
, atu."Samsara Customer"
, atu."DroneDeploy Customer"
, atu."Raken Customer"
, "Policy"."selectedQuoteId" as "quoteId"
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
WHERE 
    "Quote"."status" <> 'DISCARDED' 
    AND "Quote"."deletedAt" IS null
    AND "Policyholder"."deletedAt" IS null
    AND "Policy"."deletedAt" IS null 
ORDER BY "Policy"."id", "Quote"."updatedAt" DESC, qd."version" DESC
)


SELECT
    *
FROM 
    (SELECT 
        "Policy"."policyNumber" as "Policy Number",
        'ENDORSEMENT' AS "Business Type",
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
