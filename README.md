# # 🚗 Uber Data Analysis (SQL Project)
This project analyzes Uber ride data to uncover insights about trip patterns, speed efficiency, and travel behavior between weekdays and weekends.  
All analysis was done using **BigQuery SQL**.

# About Data
The dataset was obtained from the [UBER](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1svirtual-dogfish-471800-c7!2suber)
| Column              | Data type      | Mode
| :------------------ | :------------- | :------------- |
| start_date          | DATE           | NULLABLE       |
| start_hour          | FLOAT          | NULLABLE       |
| start_minute        | FLOAT          | NULLABLE       |
| end_date            | DATE           | NULLABLE       |
| end_hour            | FLOAT          | NULLABLE       |
| end_minutes         | FLOAT          | NULLABLE       |
| month               | STRING         | NULLABLE       |
| year                | INTEGAR        | NULLABLE       |
| CATEGORY            | STRING         | NULLABLE       |
| START               | STRING         | NULLABLE       |
| STOP                | STRING         | NULLABLE       |
| MILES               | FLOAT          | NULLABLE       |
| PURPOSE             | STRING         | NULLABLE       |
| duration            | FLOAT          | NULLABLE       |
| speed               | FLOAT          | NULLABLE       |
| day                 | STRING         | NULLABLE       |
| day_time            | STRING         | NULLABLE       |

## 🔍 Analysis Overview

### 🧩 Poin 1 – Trip Summary by Day Type
File: `UBER_POIN_1.sql`

**Goal:** Compare Uber trip performance between weekdays and weekends.  
**Key Metrics:**
- Total trips per category and day type  
- Average trip per day  
- Average duration, distance, and speed  

📈 *Helps understand how user activity differs by day type.*

### ⚡ Poin 2 – Busiest Hours and Days
File: `UBER_POIN_2.sql`

**Goal:** Identify the most active hours and days for Uber rides.  
**Insights:**
- Compare number of trips per hour between weekdays and weekends  
- Top 10 busiest day-hour combinations  

📊 *Useful for resource allocation and surge pricing optimization.*

### 🧠 Poin 3 – Efficiency by Trip Purpose
File: `UBER_POIN_3.sql`

**Goal:** Measure trip efficiency based on speed and purpose.  
**Approach:**
- Classify rides as `Efficient`, `Moderate`, or `Inefficient`  
- Analyze which purposes and day types have highest inefficiency  

📍 *Gives insight into driving conditions and trip optimization.*

## 💡 Key Insights (Summary)
- Weekend trips tend to have longer average durations but lower frequency.  
- Rush hours (8–9 AM and 5–6 PM) dominate total rides.  
- Business-related trips show higher inefficiency compared to personal ones.

  ## 📎 Author
**Iza** – Data Analyst Enthusiast
