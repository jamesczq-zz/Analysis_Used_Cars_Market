# -*- coding: utf-8 -*-
from scrapy import Item, Field

class DemoItem(Item):
	Model = Field()
	Price = Field()
	Mileage = Field()
	Body = Field()
	Color = Field()
	Engine = Field()
