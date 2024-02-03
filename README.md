# BIPM

This repo contains all the code from the BIPM Course.

## How did I get set up with Jupyter and Python in VS Code?

1. Install Python and Jupyter Extensions
2. Create .ipynb file

## Data Science Links:
- Kaggle: https://www.kaggle.com/competitions/navigating-hospital-visits/leaderboard
- Questions: https://docs.google.com/document/d/1NQ1W-ytOdl0QWisfK2ylfNxa6TvpJuLaaYxgGCu_UCE/edit?usp=sharing

## Data Warehousing Links: 
- Business Requirements: https://docs.google.com/document/d/1xfpO8y0kQnO2KIg29_S9erxgKK3JonOGPll6Ckuvv_g/edit
- Information Package: https://docs.google.com/document/d/1YPMIcR879QKKX8Oswc_06ctGOr0-Nrnt/edit
- ME/R Diagram: https://docs.google.com/presentation/d/1qOdhP995Zp7jnxUochd5-qkKedskjazzTdLIEBN41Fg/edit?usp=sharing
- dbt Project Structure: https://docs.google.com/document/d/1unSWr1jOlLBnb8edzfTtiNXR3IYtcOa68ULvRWtUUTU/edit?usp=sharing

## Data Science Checklist:

Next Steps 02/02:
1. Weights
2. Columns (Feature Importance) / Permutation Feature Importance
3. Hyper-parameter tuning (random search)

Best performing model: svc with weights 2,2,1 to xgb, lgr, and rf with features: ["Age", "time_bw_schedule_appointment"], ['SocialWelfare', 'Sex', 'Alcoholism', 'Hipertension', "Community"]

Next Steps 03/02:
1. Check without SocialWelfare

- [x] 1. Defining the problem and goal
- [x] 2. Understanding the data
  - [x] 2.1 Dataset Description
  - [x] 2.2 Quick Analysis from Kaggle
- [x] 3. Data Quality Check
- [x] 4. Exploratory Data Analysis
  - [x] 4.1 Target Variable Distribution 
  - [x] 4.2 Relationships between variables (done in 5)
- [x] 5. Data Cleaning and Basic Preprocessing
- [x] 6. Train-Test Split
- [ ] 7. Advanced Preprocessing
    - [x] Handle Missing Data (Imputer)
    - [x] OneHotEncode categorical to numerical (?)
    - [ ] Feature Importance incl. Permutation Feature Importance
- [ ] 8. Model Building
  - [x] Decision Tree
  - [x] Random Forest
  - [x] XGBoost
  - [x] Voting Classifier
  - [x] Confusion Matrix
- [ ] 9. Model Evaluation and Interpretation
  - [x] Test.csv Preprocessing
  - [x] Evaluation against Test
- [ ] 10. Fine-Tuning and Optimization
  - [ ] GridSearch
  - [ ] Playing around with test size parameters 
- [ ] 11. Recommendations to the Hospital

## Data Science Guideline:

1. General information:
   1. Name of the used dataset
   2. List of all participating students (the group has max. 3 students)
2. Business Understanding
   1. Short description of the business problem that you want to solve (it is ok to use your assumptions)
3. Data Understanding (Exploratory Data Analysis)
   1. Description of the data set
   2. Data visualization
   3. Analysis of missing data
4. Data Preparation
   1. How and why did you select the features?
   2. Did you derive new features?
   3. How did you deal with missing data?
   4. How and why did you transform the data?
   5. How did you split the data?
     A split into test and training data is required.
     A cross-evaluation or validation set can also be used to optimize the parameters (train, validation, test set).
5. Model Building
   1. Which machine learning models did you use and why?
   2. How did you adjust the parameters of your machine learning model and why?
   3. What are the resulting machine learning models?
   4. A plus is if you build more than one machine learning model
   5. You should add an understandable description of the types of machine learning models you used
6. Model Evaluation
   1. Evaluation of the selected models: How will your models perform in practice?
   2. Did you compare different models? If yes, which one is better? For what metric?
   3. If you have a classification task, try to find a model and parameters with high accuracy in the test set. Are both errors (false positive and false negative) equally important? How could you adjust for different costs of the errors?
   4. Try to find a model and parameters with a high accuracy in the test set.
   5. Description of the approach chosen to optimize the parameters
   6. Discuss evaluation results (e.g., are false positive and false negative errors equally important? How could you balance the different costs of the errors)?
7. Possible Business Use
   1. How would your model help the business? How is it solving the business problem?
   2. What is the meaning of your model and your solution from a business perspective?

## Data Warehousing Checklist:

- [x] 1. Defining business requirements  (01.12.2023)
- [x] 2. Defining information packages (01.12.2023)
- [x] 3. ME/R diagram (03.12.2023)
- [x] 4. Data Quality and Profiling
  - [x] 4.1 Referntial Integrity 
- [x] 5. Extract and Load (Airbyte) (06.12.2023)
- [ ] 6. Transformation (dim/fact table) with dbt (12.12.2023)
  - [ ] 6.1 Slowly Changing Dimensions (Retailers + Materials)
  - [x] 6.2 Star Schema (Data Mart)
  - [ ] 6.3 External (remaining: shipping times)
- [ ] 7. Import additional data and do the analysis (?)
- [ ] 8. Visualizing data with Tableau: (remaining: shipping times + currencies)
- [ ] 9. Process Mining
- [ ] 10. Business Recommendations
- [ ] 11. Record Presentation
- [ ] 12. Create Report

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

## Data Science Exam:
1. Metrics for evaluating models (incl. confusion matrix). (Might be good to have a non-programmatic calculator).
2. Overfitting vs Underfitting (generalization and what it actually means).
  2.1 How to counter overfitting?
3. Fundamental understanding of how decision trees are built and implied (as XGboost and other parameters are also dependent on it).
4. _We will not have to write code but might have to interpret._
   
