# Heroku Deployment Guide for AI Text Summarizer
**Created by Jatin Jangid**

## 🚀 Quick Deployment to Heroku

### Method 1: One-Click Deployment (Recommended)

1. **Click the Deploy Button**:
   [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

2. **Fill in the app details**:
   - App name: `your-unique-app-name`
   - Region: Choose your preferred region
   - Environment variables are pre-configured

3. **Click "Deploy app"** and wait for completion (5-10 minutes)

4. **Click "View"** to open your deployed application

### Method 2: Manual Deployment via Git

#### Prerequisites
- [Heroku Account](https://signup.heroku.com/)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) installed
- Git installed

#### Step-by-Step Instructions

1. **Login to Heroku**:
   ```bash
   heroku login
   ```

2. **Navigate to your project directory**:
   ```bash
   cd Live_translator
   ```

3. **Initialize Git repository** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit - AI Text Summarizer by Jatin Jangid"
   ```

4. **Create a new Heroku application**:
   ```bash
   heroku create your-unique-app-name
   ```
   Replace `your-unique-app-name` with your desired app name.

5. **Set environment variables** (optional):
   ```bash
   heroku config:set MODEL_NAME=t5-small
   heroku config:set MAX_CHUNK_LENGTH=512
   ```

6. **Deploy to Heroku**:
   ```bash
   git push heroku main
   ```

7. **Scale the web dyno**:
   ```bash
   heroku ps:scale web=1
   ```

8. **Open your application**:
   ```bash
   heroku open
   ```

## 📋 Deployment Files Explained

The following files are essential for Heroku deployment:

### 1. `Procfile`
```
web: uvicorn app:app --host=0.0.0.0 --port=${PORT:-5000}
```
Tells Heroku how to run your application.

### 2. `runtime.txt`
```
python-3.11.9
```
Specifies the Python version to use.

### 3. `requirements.txt`
Contains all Python dependencies with CPU-optimized versions for Heroku.

### 4. `app.json`
Configuration for one-click deployment and Heroku Button.

## 🔧 Optimizations for Heroku

The application has been optimized for Heroku's environment:

1. **Model Selection**: Uses T5-Small instead of BART for faster loading and less memory usage
2. **Memory Management**: Reduced chunk sizes when running on Heroku
3. **Port Handling**: Dynamic port assignment from environment variables
4. **CPU Optimization**: PyTorch CPU version for better compatibility

## 📊 Heroku Limitations & Solutions

### Free Tier Limitations:
- **512MB RAM**: App uses optimized models and settings
- **30-second timeout**: Large texts are processed in chunks
- **Sleep after 30 minutes**: Cold starts may be slow

### Solutions Implemented:
- Lightweight T5-Small model
- Efficient text chunking
- Reduced memory footprint
- Error handling for timeouts

## 🌐 Accessing Your Deployed App

After successful deployment:

1. **Main Application**: `https://your-app-name.herokuapp.com`
2. **API Documentation**: `https://your-app-name.herokuapp.com/docs`
3. **Health Check**: `https://your-app-name.herokuapp.com/health`

## 🔍 Monitoring & Debugging

### View logs:
```bash
heroku logs --tail
```

### Check dyno status:
```bash
heroku ps
```

### Restart app:
```bash
heroku restart
```

## 🚀 Upgrading to Paid Plans

For better performance, consider upgrading:

1. **Hobby Plan ($7/month)**:
   - No sleeping
   - Custom domain support
   - Better performance

2. **Standard Plans ($25+/month)**:
   - More memory (1GB+)
   - Better for larger models
   - Faster processing

### To upgrade:
```bash
heroku ps:resize web=hobby
```

## 📞 Support

If you encounter issues during deployment:

1. **Check the logs**: `heroku logs --tail`
2. **Verify all files**: Ensure Procfile, runtime.txt, and requirements.txt are present
3. **Model loading**: First request may take 30-60 seconds
4. **Memory issues**: Try reducing max_length parameter

## 🎉 Success!

Your AI Text Summarizer by Jatin Jangid is now live on Heroku! 

**Share your deployed app** and start summarizing text with the power of AI.

---

**Created with ❤️ by Jatin Jangid | Powered by Heroku & AI**
