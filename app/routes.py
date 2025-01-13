from flask import Blueprint, request, jsonify
import pandas as pd
from app.model_utils import load_model
import logging

logging.basicConfig(level=logging.INFO)

bp = Blueprint("routes", __name__)

# Load the model
model = load_model("models/DecisionTree.pkl")

# Required fields and default values
REQUIRED_FIELDS = ["age", "sex", "cp", "trestbps", "chol", "fbs", "thalach", "oldpeak", "exang"]
DEFAULT_VALUES = {
    "age": 0,            # Default to 0 (though unlikely to happen; prompt users to fill this in).
    "sex": 0,            # Default to 0 (assumes "female" if not provided).
    "cp": 3,             # Default to "No chest pain" (3).
    "trestbps": 120,     # Normal resting blood pressure.
    "chol": 200,         # Average cholesterol level.
    "fbs": 0,            # Default to "False" for fasting blood sugar > 120 mg/dL.
    "thalach": 150,      # Normal maximum heart rate achieved.
    "oldpeak": 0.0,      # Default to no ST depression (indicating no significant abnormality).
    "slope": 2,          # Flat slope (most common).
    "ca": 0,             # No major vessels colored by fluoroscopy.
    "thal": 2            # Normal thalassemia.
}


@bp.route("/predict", methods=["POST"])
def predict():
    try:
        # Parse incoming JSON
        user_data = request.json
        if not user_data:
            return jsonify({"error": "No input data provided"}), 400

        # Validate and fill missing fields
        missing_fields = [field for field in REQUIRED_FIELDS if field not in user_data]
        for field in missing_fields:
            user_data[field] = DEFAULT_VALUES[field]
        logging.info(f"Processed user data: {user_data}")

        # Convert to DataFrame
        input_df = pd.DataFrame([user_data])

        # Prediction and probability
        prediction = model.predict(input_df)[0]
        probability = (
            model.predict_proba(input_df)[0][1]
            if hasattr(model, "predict_proba") else "N/A"
        )

        return jsonify({
            "prediction": int(prediction),
            "probability": probability,
            "missing_fields": missing_fields  # Include this for transparency
        })

    except KeyError as ke:
        return jsonify({"error": f"Missing key: {str(ke)}"}), 400
    except ValueError as ve:
        return jsonify({"error": f"Value error: {str(ve)}"}), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 500
