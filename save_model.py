import joblib
from hypertension_models import models

# Save the trained model
joblib.dump(models["Logisitic Regression"], "hypertension_model.pkl")
