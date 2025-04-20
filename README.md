# 🌐 MiniSearch Engine(`Big Data Project`)
This is a Big Data project that integrates **web crawling**, **PageRank**, **inverted indexing**, and a **Flutter-based UI** to build a lightweight search engine. The system demonstrates core concepts in distributed data processing, retrieval, and ranking — scaled down for educational or prototype use.

## 📁 Project Structure
- `Web_Crawler_and_Page_Rank/lib/`  
  Contains Python scripts for web crawling and computing PageRank scores on collected data.

- `inverted_index/`  
  Implements an inverted index for fast keyword-based retrieval.

- `search_engine_Flutter/`  
  Frontend user interface built with Flutter.

## 🎯 Objective
Design and implement a simplified search engine from scratch as a hands-on Big Data engineering project. The project mimics key functions of real-world search engines including:

- Web crawling
- Indexing large-scale text data
- Ranking using PageRank
- Serving results via a user interface

## 🔧 How It Works
### 🕷️ Web Crawler
- Scrapes web pages and stores raw HTML content for parsing and analysis.

### 🧮 PageRank
- Applies the PageRank algorithm on the link graph generated from crawled pages to determine the importance of each page.

### 🔍 Inverted Index (MapReduce)
- Creates an efficient mapping from keywords to URLs/pages that contain them, enabling fast search queries.
- Implemented using Hadoop MapReduce with the following Java classes:
    - MapperIndex.java – Extracts words from documents and emits (word, docId) pairs.
    - ReducerIndex.java – Aggregates all document IDs per word to build the index.
    -  CombinerIndex.java – Optimizes MapReduce by combining local mapper output before shuffling.
    - DriverIndex.java – Configures and launches the MapReduce job.
    - 
### 📱 Flutter UI
- A clean, modern interface to let users search and view ranked results.
![ui](https://github.com/user-attachments/assets/4d039cf6-087b-4512-9581-853ebe047099)
🎥 Demo
- Check out a short demo of the project in action:

https://github.com/user-attachments/assets/fcbff551-00cf-475c-a9ae-ce8a830685fc


