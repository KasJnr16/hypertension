from flask import Blueprint, request, jsonify
import pandas as pd
from app.model_utils import load_model

bp = Blueprint("routes", __name__)

# Load the model
model = load_model("models/DecisionTree.pkl")

@bp.route("/predict", methods=["POST"])
def predict():
    try:
        user_data = request.json
        input_df = pd.DataFrame([user_data])
        # Make prediction
        prediction = model.predict(input_df)[0]
        # Get probability if available
        if hasattr(model, "predict_proba"):
            probability = model.predict_proba(input_df)[0][1]
        else:
            probability = "N/A"

        return jsonify({"prediction": int(prediction), "probability": probability})
    except Exception as e:
        return jsonify({"error": str(e)})
