# AI Text Summarizer by Jatin Jangid

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

A complete text summarization application built with **FastAPI**, **Hugging Face Transformers**, and **Streamlit** by **Jatin Jangid**.

## 🌟 Created by Jatin Jangid

This project represents my passion for making advanced AI technology accessible to everyone. As an AI/ML enthusiast, I've designed this application to transform how people interact with large amounts of text.

## 🚀 Features

- **AI-Powered Summarization**: Uses state-of-the-art models like BART for high-quality abstractive summarization
- **Scalable Backend**: FastAPI-based REST API with efficient model loading and async processing
- **Interactive Frontend**: Clean, user-friendly Streamlit interface
- **File Upload Support**: Upload text files or paste content directly
- **Smart Text Chunking**: Handles long documents by intelligently splitting text
- **Download Summaries**: Save generated summaries as text files
- **Real-time Statistics**: Track compression ratios and processing metrics
- **Error Handling**: Robust error handling throughout the application

## 🛠️ Tech Stack

- **Backend**: FastAPI + Uvicorn
- **Deep Learning**: PyTorch + Hugging Face Transformers
- **Frontend**: Streamlit
- **Model**: facebook/bart-large-cnn (can be changed to t5-small for faster loading)

## 📦 Installation

### Prerequisites
- Python 3.8 or higher
- At least 4GB RAM (8GB+ recommended for BART model)
- CUDA-compatible GPU (optional, for faster processing)

### Setup Instructions

1. **Clone or download the project**:
   ```bash
   git clone <repository-url>
   cd Live_translator
   ```

2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv summarizer_env
   
   # On Windows
   summarizer_env\Scripts\activate
   
   # On macOS/Linux
   source summarizer_env/bin/activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

   **Note**: The first run will download the pre-trained model (~1.6GB for BART), which may take some time depending on your internet connection.

## 🚀 Running the Application

### Step 1: Start the Backend Server

Open a terminal/command prompt and run:

```bash
python app.py
```

The FastAPI backend will start on `http://localhost:8000`. You should see:
```
INFO:     Started server process
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Loading model: facebook/bart-large-cnn
INFO:     Model loaded successfully!
```

**Note**: The first startup will take 2-3 minutes as it downloads and loads the model.

### Step 2: Start the Frontend

Open a **new** terminal/command prompt (keep the backend running) and run:

```bash
streamlit run frontend.py
```

The Streamlit frontend will start on `http://localhost:8501` and should automatically open in your browser.

## 📚 API Documentation

### Backend Endpoints

Once the backend is running, visit `http://localhost:8000/docs` for interactive API documentation.

#### Key Endpoints:

- **POST /summarize**: Main summarization endpoint
  ```json
  {
    "text": "Your long text here...",
    "max_length": 150,
    "min_length": 30
  }
  ```

- **GET /health**: Check backend status and model information
- **GET /**: API information and available endpoints

### Example API Usage

```python
import requests

response = requests.post("http://localhost:8000/summarize", json={
    "text": "Your long text to summarize...",
    "max_length": 150,
    "min_length": 30
})

summary_data = response.json()
print(summary_data["summary"])
```

## 💡 Usage Tips

1. **Input Text**: Paste or upload text files up to 50,000 characters
2. **Summary Length**: Adjust min/max length in the sidebar for optimal results
3. **File Upload**: Supports .txt files for convenient document processing
4. **Model Performance**: First summarization may be slower due to model initialization
5. **Long Documents**: The system automatically chunks long texts for processing

## 🔧 Customization

### Changing the Model

Edit `app.py` to use a different model:

```python
# For faster processing (smaller model)
summarizer = TextSummarizer(model_name="t5-small")

# For better quality (larger model) - default
summarizer = TextSummarizer(model_name="facebook/bart-large-cnn")

# Other options
summarizer = TextSummarizer(model_name="google/pegasus-xsum")
```

### Adjusting Parameters

In `summarizer.py`, you can modify:
- `max_chunk_length`: Maximum tokens per chunk (default: 1024)
- Model generation parameters in `summarize_chunk()` method

### Frontend Customization

Modify `frontend.py` to:
- Change the UI theme and styling
- Add new input methods
- Customize summary display formats
- Add additional statistics or features

## 🐛 Troubleshooting

### Common Issues

1. **Model Loading Errors**:
   - Ensure you have enough RAM (4GB+ recommended)
   - Check internet connection for model download
   - Try switching to a smaller model like "t5-small"

2. **Backend Connection Issues**:
   - Verify the backend is running on port 8000
   - Check if port 8000 is available
   - Ensure both frontend and backend are using the same URLs

3. **CUDA Errors**:
   - The application automatically falls back to CPU if CUDA is unavailable
   - For GPU usage, ensure PyTorch CUDA version matches your system

4. **Memory Issues**:
   - Reduce `max_chunk_length` in `summarizer.py`
   - Use a smaller model like "t5-small"
   - Process smaller text chunks

### Performance Optimization

- **GPU Usage**: Install CUDA-compatible PyTorch for faster processing
- **Model Caching**: Models are cached after first download
- **Batch Processing**: For multiple documents, use the API directly

## 📁 Project Structure

```
Live_translator/
├── app.py              # FastAPI backend server
├── summarizer.py       # Text summarization logic
├── frontend.py         # Streamlit frontend interface
├── requirements.txt    # Python dependencies
└── README.md          # This file
```

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve this project!

## 📄 License

This project is open source and available under the MIT License.

---

**Happy Summarizing! 🎉**
