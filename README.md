EV Market Segmentation & Price Prediction (R)

Overview

This project analyzes electric vehicle (EV) data to uncover market segments and understand the key factors influencing pricing. Using clustering techniques and regression models, the analysis demonstrates how data can support product positioning and pricing strategies in the EV market.

---

Objectives

* Segment EVs into meaningful groups based on performance and efficiency
* Identify key drivers influencing vehicle price
* Evaluate predictive models for EV price estimation

---

🛠️ Tools & Technologies

R
* **Clustering:** K-means, Hierarchical Clustering, Self-Organizing Maps (SOM)
* **Modeling:** Linear Regression, Multiple Regression
* **Libraries:** factoextra, kohonen

---

## 📊 Dataset Summary

* **198 observations** (EV models)
* **10 features**, including:

  * Battery capacity (kWh)
  * Range
  * Energy consumption (Wh/km)
  * Top speed
  * Fast charging speed
  * Price

Each observation represents a unique electric vehicle model.

---

## 📊 Key Visualizations

### 🔹 Market Segmentation (K-Means Clustering)

![K-Means Clusters](outputs/kmeans_clusters.png)

### 🔹 Hierarchical Clustering

![Hierarchical Clustering](outputs/hierarchical_clustering.png)

### 🔹 Self-Organizing Map (SOM)

![SOM Mapping](outputs/som_mapping.png)

### 🔹 Distance Matrix Analysis

![Distance Matrix](outputs/euclidean_distance.png)

---

## 🔍 Key Insights

### 🚘 Market Segmentation

* EVs are grouped into **three primary segments**:

  * **Budget EVs:** Low battery capacity, shorter range, lower price (e.g., compact city cars)
  * **Mid-range EVs:** moderate specs with balanced pricing (family sedans, crossovers)
  * **Premium EVs:** High battery capacity, long range, high performance, and high price (luxury brands)

* Clustering methods (K-means, hierarchical, SOM) consistently reveal **clear structural groupings**, validating segmentation reliability

---

### ⚡ Distance & Similarity Analysis

* Euclidean and Manhattan distance matrices highlight **similar vehicle groups based on performance and efficiency**
* Maximum distance effectively identifies **outliers**, particularly luxury vehicles with extreme pricing
* Premium vehicles (e.g., high-end models) show the greatest dissimilarity due to pricing differences

---

### 🧠 SOM (Self-Organizing Map) Insights

* SOM preserves relationships between vehicles while reducing dimensionality
* Neighboring nodes represent **similar EV configurations**
* Distinct clusters emerge based on:

  * Battery capacity
  * Range
  * Energy efficiency
  * Price

---

### 📈 Price Prediction Insights

#### 🔹 Battery vs Price

* Strong **positive relationship**
* Higher battery capacity → higher price
* Indicates battery is a key pricing factor

#### 🔹 Wh/km vs Price

* Weaker relationship compared to battery
* Still contributes to pricing trends but less predictive alone

---

### 📊 Model Performance

* **Single-variable models:**

  * Battery → strong correlation but higher prediction error
  * Wh/km → lower error but weaker relationship

* **Multiple regression models:**

  * Combining variables significantly improves prediction accuracy
  * Lower RMSE and MAE values indicate better model performance

* Two strong predictive combinations:

  * **Battery + Wh/km** → best balance of accuracy and interpretability
  * **Top Speed + Fast Charging Speed** → equally strong predictors of price

---

### ⚠️ Model Limitations

* Some predictions produce unrealistic values (e.g., negative prices)
* Indicates missing variables and limitations of linear modeling
* Suggests need for more advanced models in real-world applications

---

## 🧠 Conclusion

This project demonstrates how machine learning and statistical techniques can be applied to:

* Segment products into meaningful market categories
* Identify key pricing drivers
* Improve predictive accuracy using multi-variable models

The results highlight the importance of combining multiple features to better capture real-world complexity in pricing.

---

## ⚠️ Dataset

This dataset was provided as part of university coursework and is not included due to sharing restrictions.

It includes EV attributes such as:

* Battery capacity
* Energy consumption (Wh/km)
* Price
* Top speed
* Fast charging speed

---

## 🚀 How to Run

1. Clone the repository
2. Open `scripts/ev_analysis.R` in RStudio
3. Update dataset path if required
4. Run the script to generate outputs

---

## 📁 Project Structure

```id="sk6w7f"
ev-market-analysis-r/
│
├── scripts/
│   └── ev_analysis.R
│
├── outputs/
│   ├── kmeans_clusters.png
│   ├── hierarchical_clustering.png
│   ├── som_mapping.png
│   ├── euclidean_distance.png
│
├── README.md
```

---

## 💡 Future Improvements

* Apply advanced models (Random Forest, Gradient Boosting)
* Include more real-world EV datasets
* Build an interactive dashboard for business users
* Extend analysis to demand forecasting and recommendation systems

---
