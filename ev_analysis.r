# =========================================
# PROJECT: EV Market Segmentation & Price Prediction
# =========================================
# Objective:
# 1. Segment electric vehicles into meaningful clusters
# 2. Identify key factors influencing EV pricing
# =========================================

# ==============================
# 1. LOAD LIBRARIES
# ==============================
library(factoextra)
library(kohonen)

# ==============================
# 2. LOAD DATA
# ==============================
# NOTE: Update path if needed
ev.data <- read.csv("data/electric_vehicle_specs.csv", row.names = 1)

# Inspect data
head(ev.data)
str(ev.data)
dim(ev.data)

# ==============================
# 3. DATA PREPROCESSING
# ==============================

# Scale data for clustering
ev.scaled <- scale(ev.data)

# ==============================
# 4. DISTANCE MATRICES
# ==============================

# Euclidean distance
ev.dist <- dist(ev.scaled)
png("outputs/euclidean_distance.png")
fviz_dist(ev.dist, lab_size = 3)
dev.off()

# Manhattan distance
d_manhattan <- dist(ev.scaled, method = "manhattan")
png("outputs/manhattan_distance.png")
fviz_dist(d_manhattan, lab_size = 3)
dev.off()

# Maximum distance
d_max <- dist(ev.scaled, method = "maximum")
png("outputs/max_distance.png")
fviz_dist(d_max, lab_size = 3)
dev.off()

# ==============================
# 5. K-MEANS CLUSTERING
# ==============================

set.seed(123)
km <- kmeans(ev.scaled, centers = 3)

png("outputs/kmeans_clusters.png")
fviz_cluster(km, data = ev.scaled, repel = TRUE, labelsize = 6)
dev.off()

# Optimal clusters using silhouette method
png("outputs/optimal_clusters.png")
fviz_nbclust(ev.scaled, kmeans, k.max = 10, method = "silhouette")
dev.off()

# ==============================
# 6. HIERARCHICAL CLUSTERING
# ==============================

d_euclidean <- dist(ev.scaled, method = "euclidean")
hc <- hclust(d_euclidean, method = "ward.D")

png("outputs/hierarchical_clustering.png")
plot(hc)
rect.hclust(hc, k = 3)
dev.off()

# ==============================
# 7. SELF-ORGANIZING MAP (SOM)
# ==============================

som_grid <- somgrid(xdim = 5, ydim = 5)
som_model <- som(ev.scaled, grid = som_grid, rlen = 1000)

# Basic SOM plot
png("outputs/som_basic.png")
plot(som_model)
dev.off()

# Mapping plot
png("outputs/som_mapping.png")
plot(som_model, type = "mapping", labels = rownames(ev.data), cex = 0.5)
dev.off()

# Training progress
png("outputs/som_changes.png")
plot(som_model, type = "changes")
dev.off()

# SOM clustering
som.km <- kmeans(getCodes(som_model), centers = 3)$cluster

png("outputs/som_clusters.png")
plot(som_model, type = "mapping",
     bgcol = rainbow(3)[som.km],
     labels = rownames(ev.data),
     cex = 0.5)
dev.off()

# ==============================
# 8. REGRESSION ANALYSIS
# ==============================

# Select relevant features
ev.model.data <- ev.data[, c("Battery", "WhperKm", "Price")]

# Train-test split
set.seed(42)
train.rows <- sample(1:nrow(ev.model.data), round(nrow(ev.model.data) * 0.8))

train.set <- ev.model.data[train.rows, ]
test.set  <- ev.model.data[-train.rows, ]

# ==============================
# 9. SIMPLE LINEAR REGRESSION
# ==============================

# Model 1: Battery vs Price
model_battery <- lm(Price ~ Battery, data = train.set)

# Model 2: Efficiency vs Price
model_efficiency <- lm(Price ~ WhperKm, data = train.set)

# Predictions
pred_battery <- predict(model_battery, newdata = test.set)
pred_efficiency <- predict(model_efficiency, newdata = test.set)

# ==============================
# 10. MULTIPLE REGRESSION
# ==============================

model_multi <- lm(Price ~ Battery + WhperKm, data = train.set)
pred_multi <- predict(model_multi, newdata = test.set)

# ==============================
# 11. MODEL EVALUATION
# ==============================

rmse <- function(actual, predicted) {
  sqrt(mean((actual - predicted)^2))
}

mae <- function(actual, predicted) {
  mean(abs(actual - predicted))
}

cat("=== MODEL PERFORMANCE ===\n")

cat("\nBattery Model RMSE:", rmse(test.set$Price, pred_battery))
cat("\nBattery Model MAE:", mae(test.set$Price, pred_battery))

cat("\nEfficiency Model RMSE:", rmse(test.set$Price, pred_efficiency))
cat("\nEfficiency Model MAE:", mae(test.set$Price, pred_efficiency))

cat("\nMultiple Regression RMSE:", rmse(test.set$Price, pred_multi))
cat("\nMultiple Regression MAE:", mae(test.set$Price, pred_multi))

# ==============================
# END OF PROJECT
# ==============================
