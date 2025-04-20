import requests

def read_file(path):    # ip           port   ##########
    base_url = "http://192.168.249.129:50070/webhdfs/v1"
    url = f"{base_url}{path}?op=OPEN"

    response = requests.get(url)

    if response.status_code == 200:
        file_content = response.text
        print("File content:")
        print(file_content)
        return file_content
    elif response.status_code == 401:
        print("Unauthorized: Check authentication credentials.")
    elif response.status_code == 403:
        print("Forbidden: Insufficient privileges to read the file.")
    elif response.status_code == 404:
        print("Not Found: HDFS Name-node or WebHDFS service not available.")
    else:
        print("Failed to read file. Error code:", response.status_code)


read_file("/output26/part-r-00000")