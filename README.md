# User_conversion_funnel_analysis
The objective of this project is to analyze user behavior data to identify drop-offs in the conversion funnel and provide data-driven recommendations to improve purchase conversion.


# 🛒 E-Commerce Conversion Funnel Analysis

## 📌 Project Overview

This project analyzes user behavior from a real-world e-commerce event dataset to understand where users drop off in the purchase journey and identify opportunities to improve conversion rates.

Using SQL and Python, a time-ordered conversion funnel was built from 2.7M+ user events to uncover behavioral patterns and product performance insights.

---

## 🎯 Business Problem

E-commerce platforms attract large volumes of visitors, but only a small percentage complete purchases.

**Key question:**

> Where do users drop off in the conversion funnel, and how can conversions be improved?

---

## 📊 Dataset

**Source:** RetailRocket E-commerce Dataset (Kaggle)

The dataset contains user interaction logs including:

* product views
* add-to-cart actions
* completed transactions

### Data Snapshot

| Column        | Description         |
| ------------- | ------------------- |
| timestamp     | event time (ms)     |
| visitorid     | unique user ID      |
| event         | user action         |
| itemid        | product ID          |
| transactionid | purchase identifier |

**Time Range:** May 2015 – September 2015
**Total Events:** ~2.7 million

---

## 🔄 Conversion Funnel Definition

Funnel stages were derived from available event types:

1. **View** → user views a product
2. **Add to Cart** → user shows purchase intent
3. **Transaction** → completed purchase

A strict time-ordered funnel was implemented to ensure users progressed through stages sequentially.

---

## 🛠 Methodology

### Data Processing

* Imported raw CSV into MySQL
* Handled missing transaction IDs using NULL handling
* Converted timestamps to datetime format
* Created cleaned view for analysis

### Funnel Construction (SQL)

* Aggregated event-level data into user-level stages
* Captured first occurrence timestamp per stage
* Enforces chronological progression

### Analysis & Visualization (Python)

* Funnel visualization
* Drop-off percentage analysis
* Purchase trend over time
* Product-level conversion analysis

---

## 📈 Conversion Funnel Results

| Stage       | Users     |
| ----------- | --------- |
| Views       | 1,404,179 |
| Add to Cart | 32,272    |
| Purchases   | 9,682     |

### Conversion Rates

* **View → Cart:** ~2.3%
* **Cart → Purchase:** ~30%
* **Overall Conversion:** ~0.69%

---

## 📉 Funnel Visualization

**Observation:**
A significant drop occurs between viewing and adding to cart.

---

## 📉 Drop-Off Analysis

* ~97% drop-off before cart stage
* ~70% drop-off from cart to purchase

This indicates friction early in the purchase journey.

---

## 📊 Purchase Trend Over Time

Purchases remain consistent over time with periodic spikes, suggesting stable demand.

---

## 🛍 Product Conversion Insights

Top performing product:

* **Item ID:** 416017
* Views: 186
* Purchases: 32
* Conversion Rate: **17.2%**

This is ~25× higher than the site average.

---

## 🔍 Key Insights

### 1️⃣ Early Funnel Friction

Only ~2.3% of viewers add items to cart, indicating significant drop-off during product consideration.

### 2️⃣ Strong Purchase Intent After Cart

~30% of users who add items to cart complete purchases, suggesting checkout flow effectiveness.

### 3️⃣ High-Converting Products Exist

Certain products dramatically outperform the site average, indicating opportunities for promotion and recommendation optimization.

---

## 📌 Business Recommendations

### Improve View → Cart Conversion

* enhance product descriptions and images
* highlight reviews and trust signals
* improve pricing clarity and offers

### Promote High-Converting Products

* feature prominently on homepage
* bundle with low-performing items
* prioritize in recommendation engines

### Retarget Interested Users

* abandoned browse reminders
* personalized promotions
* price drop notifications

---

## ⭐ Project Highlights

✔ Analyzed 2.7M+ real e-commerce events
✔ Built time-ordered conversion funnel using SQL
✔ Identified 97% drop-off before cart stage
✔ Discovered products converting 25× above average
✔ Delivered actionable business recommendations

---

## 🧰 Tech Stack

* **SQL (MySQL)** — data processing & funnel logic
* **Python (Pandas, Matplotlib)** — analysis & visualization
* **Jupyter Notebook** — exploratory analysis

---


## 🚀 What This Project Demonstrates

* Product analytics thinking
* Funnel & conversion analysis
* SQL aggregation & data modeling
* Data storytelling & visualization
* Business insight generation

---

## 📬 Future Improvements

* Segment funnel by new vs returning users
* Analyze device or session behavior
* Build recommendation insights
* A/B testing simulation

---

## 👤 Author

**Swayam**
Aspiring Data Scientist | Product Analytics Enthusiast

---
