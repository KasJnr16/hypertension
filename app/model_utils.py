import joblib


def load_model(file_path):
    """Load a saved model from the given file path."""
    try:
        return joblib.load(file_path)
    except FileNotFoundError:
        raise FileNotFoundError(f"Model file not found: {file_path}")


def save_model(model, file_path):
    """Save a trained model to the given file path."""
    joblib.dump(model, file_path)
