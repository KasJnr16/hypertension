import pandas as pd
import numpy as np
import matplotlib
from matplotlib import pyplot as plt
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier

from app.model_utils import save_model

matplotlib.use('TkAgg')
DATA_PATH = "data/hypertension_data.csv"

# Load and preprocess data
try:
    hyp = pd.read_csv(DATA_PATH)
    print("Dataset loaded successfully.")
except FileNotFoundError:
    raise FileNotFoundError(f"Dataset not found at {DATA_PATH}.")

target_counts = hyp["target"].value_counts()
print("Hypertension distribution:")
print(target_counts)

# Data preparation
hyp = hyp[np.isfinite(hyp).all(1)]  # Ensure no missing or infinite values
X = hyp.drop("target", axis=1)
y = hyp[["target"]]

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2,random_state=42)

models = {
    "LogisticRegression": LogisticRegression(max_iter=20000),
    "RandomForest" : RandomForestClassifier(n_estimators=100, max_depth=5, random_state=42),
    "DecisionTree": DecisionTreeClassifier(max_depth=5, min_samples_split=10),
    "KNN": KNeighborsClassifier(n_neighbors=10),
}

# Initialize variables for best model selection
best_model_name = None
best_testing_f1 = 0
results = []  # To store all metrics

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

    # Append metrics to results
    results.append({
        "Model": model_name,
        "Training Accuracy": metrics["Training Accuracy"],
        "Testing Accuracy": metrics["Testing Accuracy"],
        "Testing F1": metrics["Testing F1"],
        "Testing Precision": metrics["Testing Precision"],
        "Testing Recall": metrics["Testing Recall"],
    })

    # Identify the best model
    if metrics["Testing F1"] > best_testing_f1:
        best_model_name = model_name
        best_testing_f1 = metrics["Testing F1"]

    # Save model
    try:
        save_model(model, f"models/{model_name}.pkl")
    except Exception as e:
        print(f"Error saving {model_name}: {e}")


# Print the best model
print(f"\nBest model: {best_model_name} with Testing F1: {best_testing_f1:.4f}")

# Convert results to DataFrame and print
results_df = pd.DataFrame(results)
print("\nModel Performance Summary:")
print(results_df)

# Visualize Testing Accuracy
plt.figure(figsize=(10, 6))
plt.bar(results_df["Model"], results_df["Testing Accuracy"], color='skyblue')
plt.xlabel("Models")
plt.ylabel("Testing Accuracy")
plt.title("Model Comparison: Testing Accuracy")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


