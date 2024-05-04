## Data Warehousing Checklist:

- [x] 1. Defining business requirements  (01.12.2023)
- [x] 2. Defining information packages (01.12.2023)
- [x] 3. ME/R diagram (03.12.2023)
- [x] 4. Data Quality and Profiling
  - [x] 4.1 Referntial Integrity 
- [x] 5. Extract and Load (Airbyte) (06.12.2023)
- [x] 6. Transformation (dim/fact table) with dbt (12.12.2023)
  - [x] 6.1 Slowly Changing Dimensions (Retailers + Materials)
  - [x] 6.2 Star Schema (Data Mart)
  - [x] 6.3 External (remaining: shipping times)
- [x] 7. Visualizing data with Tableau: (remaining: shipping times + currencies)
- [ ] 8. Process Mining
- [ ] 9. Business Recommendations
- [ ] 10. Record Presentation
- [ ] 11. Create Report

## Data Warehousing Guideline:

1. Analysis of the business requirements of the data mart, including identifying important KPIs
for the data mart.
2. Analysis of the relevant data source(s) (i.e., tables in the operational database), including an
analysis of the data quality (data profiling).
3. Multi-dimensional design of the data mart (conceptual design) (DbVisualizer).
4. Proof-of-concept implementation of the multi-dimensional design with data warehousing technologies of your choice
- Logical/physical multi-dimensional implementation
- ETL / Data Integration
- Dashboard for your data mart that visualizes the KPIs for the business process
- Critical reflection of the used data warehousing technologies
5. Process Mining based on the event logs of the operational databases (with a tool of your choice, e.g., Disco or ProM).
6. Business recommendations for the management and project reflection.
