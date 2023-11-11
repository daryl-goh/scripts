import requests
from bs4 import BeautifulSoup

def scrape_news(url):
    # Send a GET request to the specified URL
    response = requests.get(url)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Extract the HTML content from the response
        html = response.content

        # Parse the HTML content using BeautifulSoup
        soup = BeautifulSoup(html, 'html.parser')

        # Find all elements with the tag 'a' and class 'Card-title'
        titles = soup.find_all('a', class_='Card-title')

        # Print the text content of each title
        for title in titles:
            print(title.text)
    else:
        # Print an error message if the request was not successful
        print(f"Failed to retrieve content. Status code: {response.status_code}")

# Specify the URL of the news website
news_url = "https://www.cnbc.com/technology/"

# Call the scrape_news function with the specified URL
scrape_news(news_url)
