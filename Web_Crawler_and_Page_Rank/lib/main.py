from lib.features.web_crawler import *
from lib.features.pagerank import *


# the start page => initial
initial_links = ['https://www.dailynewsegypt.com/', 'https://www.geeksforgeeks.org/']

# Press the green button in the gutter to run the script.
if __name__ == '__main__':

    Crawler = WebCrawler(max_links=1000)
    Crawler.crawling(initial_links)

    page = PageRank()
    print(page.page_rank())