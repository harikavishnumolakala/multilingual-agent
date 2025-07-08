# Multilingual Onboarding Agent

A conversational AI agent built with Dasha.AI that provides multilingual onboarding support in **Hindi**, **Telugu**, and **English**. This agent helps collect user information through natural voice conversations in the user's preferred language.

## 🌟 Features

- **Multilingual Support**: Supports Hindi (हिंदी), Telugu (తెలుగు), and English
- **Voice Interaction**: Natural voice-based conversations using Dasha.AI
- **User Data Collection**: Collects user's name and location in their preferred language
- **Language Selection**: Interactive menu for language preference
- **Text-to-Speech**: Converts text to speech in multiple languages
- **Speech-to-Text**: Understands user speech input

## 🚀 Prerequisites

Before running this application, make sure you have:

- **Node.js** (version 14 or higher)
- **npm** (Node Package Manager)
- **Dasha.AI SDK** (included in dependencies)
- Internet connection for Dasha.AI services

## 📦 Installation

1. **Clone or download this repository**
   ```bash
   git clone <repository-url>
   cd multilingual-agent
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

## 🏃‍♂️ Running the Application

1. **Start the application**
   ```bash
   npm start
   ```
   
   Or directly with Node.js:
   ```bash
   node index.js
   ```

2. **The agent will:**
   - Deploy the Dasha application
   - Start audio recording and playback
   - Begin the conversation flow

## 📁 Project Structure

```
multilingual-agent/
├── app/
│   ├── app.dashaapp          # Dasha application configuration
│   └── app.dsl               # Conversation flow script (DashaScript)
├── index.js                  # Main application entry point
├── package.json              # Node.js dependencies and scripts
├── package-lock.json         # Dependency lock file
└── README.md                 # This file
```

## 🎯 How It Works

### Conversation Flow

1. **Welcome & Language Selection**
   - Agent greets the user in English
   - Provides options: Press 1 for Hindi, 2 for Telugu, 3 for English

2. **Name Collection**
   - Asks for user's full name in selected language
   - Stores the response in context variables

3. **Location Collection**
   - Asks for user's current location in selected language
   - Stores the response in context variables

4. **Completion**
   - Thanks the user and confirms completion
   - Ends the conversation

### Language-Specific Prompts

| Language | Name Question | Location Question |
|----------|---------------|-------------------|
| **Hindi** | आपका पूरा नाम क्या है? | आप कहाँ रहते हैं? |
| **Telugu** | మీ పేరు ఏమిటి? | మీరు ఎక్కడ నివసిస్తున్నారు? |
| **English** | What is your full name? | Where are you currently located? |

## ⚙️ Configuration

### Dasha Application Settings

The `app/app.dashaapp` file contains the main configuration:

```json
{
  "name": "multilingual-onboarding",
  "version": "1.0.0",
  "description": "Multilingual onboarding agent",
  "applicationType": "text-to-text",
  "dialogue": {
    "entryPoint": "app.dsl"
  }
}
```

### Context Variables

The application stores collected data in these context variables:
- `name_en`, `location_en` - English responses
- `name_hi`, `location_hi` - Hindi responses  
- `name_te`, `location_te` - Telugu responses

## 🛠️ Development

### Adding New Languages

To add support for a new language:

1. **Add new context variables** in `app/app.dsl`:
   ```javascript
   context {
     output name_<lang_code>: string = "";
     output location_<lang_code>: string = "";
   }
   ```

2. **Create new nodes** for the language:
   ```javascript
   node onboarding_<language> {
     do {
       #sayText("Your question in the new language");
       wait *;
     }
     transitions {
       location: goto location_<lang> on #getMessageText() is not null;
     }
     onexit {
       location: do {
         set $name_<lang> = #getMessageText();
       }
     }
   }
   ```

3. **Update the root node** to include the new language option.

### Customizing Questions

Modify the `#sayText()` calls in the respective language nodes in `app/app.dsl` to change the questions asked to users.

## 📝 Scripts

- `npm start` - Run the application
- `npm test` - Run tests (currently just a placeholder)

## 🔧 Dependencies

- **@dasha.ai/sdk**: ^0.10.21 - Dasha.AI SDK for conversational AI

## 🐛 Troubleshooting

### Common Issues

1. **"Connection failed" error**
   - Ensure you have internet connection
   - Check Dasha.AI service status

2. **Audio not working**
   - Check microphone permissions
   - Verify audio input/output devices

3. **Language not recognized**
   - Ensure clear pronunciation
   - Check if the language is properly configured

### Getting Help

- Check [Dasha.AI Documentation](https://docs.dasha.ai/)
- Review the console output for error messages
- Ensure all dependencies are properly installed

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License.

## 🌐 Supported Languages

- **English** (en) - Default language
- **Hindi** (hi) - हिंदी 
- **Telugu** (te) - తెలుగు

---

**Note**: This application requires an active internet connection to use Dasha.AI services for speech processing and natural language understanding. 