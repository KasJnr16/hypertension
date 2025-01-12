import numpy as np  # Linear algebra
import pandas as pd  # Data processing and CSV I/O library

# Data Visualization
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib

matplotlib.use('TkAgg')
sns.set(style='white', color_codes=True)

# Machine Learning Libraries
from sklearn.model_selection import train_test_split, StratifiedKFold
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.naive_bayes import MultinomialNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
import shap

# Load dataset with proper handling
DATA_PATH = "C:/Users/mojis/.cache/kagglehub/datasets/prosperchuks/health-dataset/versions/5/hypertension_data.csv"

try:
    hyp = pd.read_csv(DATA_PATH)
    print("Dataset loaded successfully.")
except FileNotFoundError:
    print(f"Dataset not found at {DATA_PATH}. Please check the path.")
    exit()

# Initial data exploration
target_counts = hyp["target"].value_counts()
print("Hypertension distribution:")
print(target_counts)

# Data preparation
hyp = hyp[np.isfinite(hyp).all(1)]  # Ensure no missing or infinite values
X = hyp.drop("target", axis=1)
y = hyp[["target"]]

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Define models and their configurations
models = {
    "Logistic Regression": LogisticRegression(max_iter=20000),
    "Decision Tree": DecisionTreeClassifier(max_depth=5, min_samples_split=10),
    "Random Forest": RandomForestClassifier(max_depth=10, n_estimators=100, min_samples_leaf=5),
    "KNN": KNeighborsClassifier(n_neighbors=10),
    "Multinomial Naive Bayes": MultinomialNB(),
}

# Model evaluation
for model_name, model in models.items():
    # Train the model
    model.fit(X_train, y_train.values.ravel())

    # Predictions
    y_train_pred = model.predict(X_train)
    y_test_pred = model.predict(X_test)

    # Metrics calculation
    metrics = {
        "Training Accuracy": accuracy_score(y_train, y_train_pred),
        "Training F1": f1_score(y_train, y_train_pred, average='weighted'),
        "Training Precision": precision_score(y_train, y_train_pred, average='weighted'),
        "Training Recall": recall_score(y_train, y_train_pred, average='weighted'),
        "Testing Accuracy": accuracy_score(y_test, y_test_pred),
        "Testing F1": f1_score(y_test, y_test_pred, average='weighted'),
        "Testing Precision": precision_score(y_test, y_test_pred, average='weighted'),
        "Testing Recall": recall_score(y_test, y_test_pred, average='weighted'),
    }

    # Display results
    print(f"\nModel: {model_name}")
    print("Training Performance:")
    for metric, value in metrics.items():
        if "Training" in metric:
            print(f"- {metric}: {value:.4f}")
    print("Testing Performance:")
    for metric, value in metrics.items():
        if "Testing" in metric:
            print(f"- {metric}: {value:.4f}")
    print("=" * 35)

# Feature importance visualization using SHAP (for Random Forest)
if "Random Forest" in models:
    explainer = shap.TreeExplainer(models["Random Forest"])
    shap_values = explainer.shap_values(X_test)

    # SHAP summary plot
    print("Generating SHAP summary plot for Random Forest model...")
    shap.summary_plot(shap_values[1], X_test)

# Stratified K-Fold Cross-Validation
print("Performing Stratified K-Fold Cross-Validation...")
skf = StratifiedKFold(n_splits=5)
for train_idx, test_idx in skf.split(X, y):
    X_train, X_test = X.iloc[train_idx], X.iloc[test_idx]
    y_train, y_test = y.iloc[train_idx], y.iloc[test_idx]

# Risk distribution visualization
sns.countplot(x="target", data=hyp)
plt.title("Risk Distribution of Hypertension")
plt.show()

# Correlation heatmap (optional)
# corr = hyp.corr()
# plt.figure(figsize=(12, 10))
# sns.heatmap(corr[(corr >= 0.3) | (corr <= -0.3)], cmap='viridis',
#             vmax=1.0, vmin=-1.0, linewidths=0.1, annot=True,
#             annot_kws={"size": 8}, square=True)
# plt.title("Correlation Heatmap")
# plt.show()

