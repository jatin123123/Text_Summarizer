@echo off
echo ====================================
echo    Text Summarizer Project Setup
echo ====================================
echo.

echo [1/3] Installing dependencies...
pip install -r requirements.txt

if %ERRORLEVEL% NEQ 0 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [2/3] Starting FastAPI Backend...
echo Note: This will download the model on first run (~1.6GB)
echo.

start "FastAPI Backend" cmd /k "python app.py"

echo Waiting for backend to initialize...
timeout /t 10 /nobreak > nul

echo.
echo [3/3] Starting Streamlit Frontend...
echo.

start "Streamlit Frontend" cmd /k "streamlit run frontend.py"

echo.
echo ====================================
echo    Setup Complete!
echo ====================================
echo.
echo Backend running at: http://localhost:8000
echo Frontend running at: http://localhost:8501
echo.
echo The browser should open automatically for the frontend.
echo Keep both terminal windows open while using the application.
echo.
echo Press any key to exit this setup script...
pause > nul
