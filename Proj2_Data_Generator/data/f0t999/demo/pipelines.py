# -*- coding: utf-8 -*-

class WriteItemPipeline(object):

	def __init__(self):
		self.filename = 'cars.txt'

	def open_spider(self, spider):
		self.file = open(self.filename, 'w')

	def close_spider(self, spider):
		self.file.close()

	def process_item(self, item, spider):
		line = '\t'.join(item.values()) + '\n'
		self.file.write(line)
		return item
