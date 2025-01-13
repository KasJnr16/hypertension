import matplotlib.pyplot as plt

from app.model_utils import load_model

model = load_model("models/DecisionTree.pkl")

importance = model.feature_importances_
features = ["age", "sex", "cp", "trestbps", "chol", "fbs", "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal"]
plt.bar(features, importance)
plt.xticks(rotation=90)
plt.show()
