# AI Text Summarizer by Jatin Jangid

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

A powerful AI-powered text summarization application created by **Jatin Jangid**. Transform lengthy documents into concise, meaningful summaries using state-of-the-art transformer models.

## 🚀 Live Demo

**Backend API**: [Your Heroku App URL]/docs
**Frontend**: [Your Heroku App URL]

## ✨ Features

- **Advanced AI Summarization**: Powered by Hugging Face Transformers
- **Smart Text Processing**: Handles long documents with intelligent chunking
- **User-Friendly Interface**: Clean, responsive Streamlit frontend
- **File Upload Support**: Process text files directly
- **Real-time Statistics**: Track compression ratios and processing metrics
- **Download Summaries**: Save generated summaries as text files
- **RESTful API**: FastAPI backend with comprehensive documentation

## 🛠️ Tech Stack

- **Backend**: FastAPI + Uvicorn
- **Frontend**: Streamlit
- **AI/ML**: PyTorch + Hugging Face Transformers
- **Model**: T5-Small (optimized for cloud deployment)
- **Deployment**: Heroku

## 📱 Quick Start

### Option 1: Use the Live Application
Simply visit the deployed application URL and start summarizing your text!

### Option 2: API Usage
```python
import requests

# Summarize text using the API
response = requests.post("https://your-app-name.herokuapp.com/summarize", json={
    "text": "Your long text to summarize here...",
    "max_length": 150,
    "min_length": 30
})

result = response.json()
print(result["summary"])
```

## 🚀 Deploy Your Own

### Prerequisites
- Heroku account
- Git installed
- Heroku CLI installed

### Deployment Steps

1. **Clone this repository**:
   ```bash
   git clone https://github.com/jatin123123/Live_translator.git
   cd Live_translator
   ```

2. **Login to Heroku**:
   ```bash
   heroku login
   ```

3. **Create a new Heroku app**:
   ```bash
   heroku create your-app-name
   ```

4. **Set Heroku stack to container (if needed)**:
   ```bash
   heroku stack:set heroku-20 -a your-app-name
   ```

5. **Deploy to Heroku**:
   ```bash
   git add .
   git commit -m "Deploy to Heroku"
   git push heroku main
   ```

6. **Scale the web dyno**:
   ```bash
   heroku ps:scale web=1
   ```

7. **Open your application**:
   ```bash
   heroku open
   ```

### Environment Variables (Optional)
```bash
heroku config:set MODEL_NAME=t5-small
heroku config:set MAX_CHUNK_LENGTH=512
```

## 📊 Performance Optimization

The application is optimized for Heroku's free tier:
- Uses T5-Small model (faster, less memory)
- Reduced chunk sizes for efficient processing
- Automatic CPU fallback
- Memory-efficient text processing

## 🔧 Local Development

1. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Run the backend**:
   ```bash
   python app.py
   ```

3. **Run the frontend** (in a new terminal):
   ```bash
   streamlit run frontend.py
   ```

## 📚 API Documentation

Once deployed, visit `/docs` endpoint for interactive API documentation.

### Key Endpoints:
- `POST /summarize` - Main summarization endpoint
- `GET /health` - Check API health and model status
- `GET /` - API information

## 💡 Usage Tips

1. **Optimal Text Length**: 100-5000 characters work best
2. **Summary Tuning**: Adjust min/max length for better results
3. **File Processing**: Upload .txt files for convenience
4. **Batch Processing**: Use the API for processing multiple documents

## 🐛 Troubleshooting

### Common Issues:
- **Slow initial response**: First request loads the model (30-60 seconds)
- **Memory errors**: Use shorter text or smaller max_length
- **Timeout errors**: Break large documents into smaller pieces

### Heroku-Specific:
- **Cold starts**: First request after inactivity may be slow
- **Memory limits**: App uses optimized settings for free tier
- **Request timeouts**: Large texts may timeout (use shorter inputs)

## 👨‍💻 About the Developer

**Jatin Jangid** - Passionate AI/ML developer focused on creating practical solutions that make advanced technology accessible to everyone.

- GitHub: [@jatin123123](https://github.com/jatin123123)
- Project: [Live Translator](https://github.com/jatin123123/Live_translator)

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## 📄 License

This project is open source and available under the MIT License.

---

**Made with ❤️ by Jatin Jangid | Powered by AI**
