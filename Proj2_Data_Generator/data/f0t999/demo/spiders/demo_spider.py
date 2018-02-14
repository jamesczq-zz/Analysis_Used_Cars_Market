# -*- coding: utf-8 -*-
from scrapy import Spider, Request
from demo.items import DemoItem
import numpy as np
import pandas as pd

class DemoSpider(Spider):
	name = 'demo_spider'
	allowed_urls = ['https://www.carfax.com']
	start_urls = ['https://www.carfax.com']

	def parse(self, response):
		df = pd.read_csv('zipcodes1k.csv', header=None, index_col=None, dtype=str)
		zipcodes = list(df[0])[0:19];
		url_list = ['https://www.carfax.com/search?zip={}&radius=10'.format(z) for z in zipcodes];

		for i in range(0, len(url_list)):
			link = url_list[i];
			yield Request(link,  callback=self.parse_top, priority=i)

	def parse_top(self, response):
		#rows = response.xpath('//div[@id="react-app"]/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[2]/div[3]/div[1]/div[2]/article')
		rows = \
		response.xpath\
		('//div[@id="react-app"]/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[2]/div[3]/div[1]/div[2]/article//div[@class="srp-list-item-description column"]/a')
		for row in rows:
			#Model = row.xpath('.//div[@class="srp-list-item-description column"]/a//span[@class="srp-list-item-basic-info-model"]/text()').extract_first()
			#Price = row.xpath('.//div[@class="srp-list-item-description column"]/a//div[@class="price-flag"]/span/text()').extract_first();
			#Mileage = row.xpath('.//div[@class="srp-list-item-description column"]/a//span[@class="srp-list-item-basic-info-mileage"]/text()').extract_first();
			#featuresList = row.xpath('.//div[@class="srp-list-item-description column"]/a//span[@class="srp-list-item-special-features-value"]/text()').extract();
			Model = row.xpath('.//span[@class="srp-list-item-basic-info-model"]/text()').extract_first()
			Price = row.xpath('.//div[@class="price-flag"]/span/text()').extract_first();
			Mileage = row.xpath('.//span[@class="srp-list-item-basic-info-mileage"]/text()').extract_first();
			featuresList = row.xpath('.//span[@class="srp-list-item-special-features-value"]/text()').extract();
			[Body, Color, Engine] = featuresList

			item = DemoItem()
			item['Model'] = Model
			item['Price'] = Price
			item['Mileage'] = Mileage
			item['Body'] = Body
			item['Color'] = Color
			item['Engine'] = Engine
			yield item
