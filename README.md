# AssignmentImageLoad

  
This iOS application is designed to efficiently load and display images in a scrollable grid. It fetches images from a specified URL and implements caching mechanisms for both disk and memory to enhance performance and reduce network usage.

  
**Features**

 - Displays a 3-column square image grid.
 - Asynchronously loads images from a given URL.
 - Implements caching to store images retrieved from the API for efficient retrieval.
 - Handles network errors and image loading failures gracefully.

**Implementation Details**

*PostModel*

The PostModel struct represents a API Response model and contains the URL of the image.

*Webservice*
The Webservice class is represent a GET API call for bellow URL and handle response with 100 Post Recored JSON array. Convert JSON Array to model and call Success callback function and if failure then call failure callback function.

    URL: https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100

*LoadImageCache*

The LoadImageCache class is responsible for fetching and caching images.
It uses NSCache for in-memory caching and performs disk caching using file operations.
Images are asynchronously loaded from the provided URL and stored in both memory and disk cache.

ViewController
The ViewController class displays the grid of images.

It fetches image URLs from the API and populates the grid with images loaded asynchronously by the LoadImageCache.

Each cell in the grid contains an image view to display the loaded images, with activity indicator, reload image button, and display failure image placeholder.

Usage

To use this application:

  

Clone the repository to your local machine. Using URL

    git clone https://github.com/Harsh171095/AssignmentImageLoad.git

Open the project in Xcode.

Build and run the application on a simulator or a physical device.

The image grid will be displayed with images fetched from the specified URL.

Notes

This application is a basic implementation to demonstrate image loading and caching in a grid view.

Additional features such as pagination, advanced error handling, and more sophisticated caching mechanisms can not implementation .
