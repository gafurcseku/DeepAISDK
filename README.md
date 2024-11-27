# What is [Deepai.org](http://deepai.org "deepai.org")

DeepAI offers a variety of APIs that cater to different aspects of artificial intelligence and machine learning. These APIs provide functionalities such as:
* **Text to Image**: This API allows users to generate images from textual descriptions.
* **AI Image Editor**: This tool enables users to edit images using AI, which can include various adjustments and enhancements.
* **Super Resolution**: The Super Resolution API is designed to upscale images without losing the original content. It uses machine learning to improve the quality of images, making them sharper and correcting any blurriness.
* **Other APIs:** DeepAI also offers APIs for image colorization and various styles for the Text to Image.

# Installation
DeepAISDK is available with Swift Package Manager. The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. Once you have your Swift package set up, adding deepai as a dependency is as easy as adding it to the dependencies value of your Package.swift.
```
dependencies: [
    .package(url: "https://github.com/gafurcseku/DeepAISDK.git", branch: "main")
]
```
# Usage
#### Initialization

To initialize API instance you need to obtain [API token](https://deepai.org/docs#apis "API token") from your Deep AI website. Login deepai.org site to get API key.

Remember that your API key is a secret! Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

Once you have a token, you can initialize DeepAISDK class, which is an entry point to the API.
```

let deepAIsdk = DeepAISDK(apiToken: "")

```

Once token you posses the token, and the instance is initialized you are ready to make requests.

# AI-Powered Image Editing Features
Our SDK provides a suite of powerful AI tools for image editing. Below are the available features and their usage examples.

#### Background Remover 
Easily remove the background of any image using AI.

```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .backgroundRemover) { isSuccess, url in  
    if isSuccess {
        print("Edited image URL: \(url)")
    } else {
        print("Failed to remove background")
    }
}

```
#### Colorizer

Add color to black-and-white images with AI-powered colorization.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .colorizer) { isSuccess, url in  
    if isSuccess {
        print("Edited image URL: \(url)")
    } else {
        print("Failed to colorize image")
    }
}

```
#### Headshots

Generate professional headshots from any image.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .headshots) { isSuccess, url in  
    if isSuccess {
        print("Headshot URL: \(url)")
    } else {
        print("Failed to generate headshot")
    }
}

```
#### Selfie Generator

Create stunning selfies using AI enhancement.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .selfieGenerator) { isSuccess, url in  
    if isSuccess {
        print("Selfie URL: \(url)")
    } else {
        print("Failed to generate selfie")
    }
}

```
#### Super Resolution

Enhance the resolution of your images for finer details.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .superResolution) { isSuccess, url in  
    if isSuccess {
        print("High-resolution image URL: \(url)")
    } else {
        print("Failed to enhance resolution")
    }
}

```
#### Upscale

Upscale images to larger dimensions without losing quality.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .upscales) { isSuccess, url in  
    if isSuccess {
        print("Upscaled image URL: \(url)")
    } else {
        print("Failed to upscale image")
    }
}

```

#### Expand

Expand the boundaries of your image while preserving its content.
```

deepAIsdk.sendImageEditRequest(data: imageData, editType: .expand) { isSuccess, url in  
    if isSuccess {
        print("Expanded image URL: \(url)")
    } else {
        print("Failed to expand image")
    }
}

```
