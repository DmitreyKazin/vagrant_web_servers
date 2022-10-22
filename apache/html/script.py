#!/usr/bin/env python3

import requests


def get_events():
    """
    :return: jewish events data from hebcal api
    """
    query_params = {"v": 1, "cfg": "json", "start": "2022-01-01", "end": "2022-12-31",
                    "c": "on", "geo": "geoname", "geonameid": "281184"}
    endpoint = "https://www.hebcal.com/hebcal"
    response = requests.get(endpoint, params=query_params)
    json_data = response.json()
    return json_data['items']


def data_eng(data):
    """
    :param data: jewish events
    :return: candle lightings
    """
    # reduce object size
    mapped_data = list(map(lambda item: {"title": item['title'], "date": item['date']}, data))
    # extract only candle lighting
    filtered_data = list(filter(lambda item: item['title'].find('Candle lighting') != -1, mapped_data))
    return filtered_data


def main():
    print ("Content-type:application/json\n")
    events_data = get_events()
    print(data_eng(events_data))


main()