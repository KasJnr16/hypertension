from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the saved model
model = joblib.load("hypertension_model.pkl")


@app.route("/predict", methods=["POST"])
def predict():
    try:
        user_data = request.json
        input_df = pd.DataFrame([user_data])
        #Make Predication
        prediction = model.predict(input_df)[0]
        probability = model.model.predict_proba(input_df)[0][1] # Probability of risk
        return jsonify({"predicition": int(prediction), "probability": probability})
    except Exception as e:
        return jsonify({"error" : str(e)})


if __name__ == "__main__":
    app.run(debug=True)
