#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://ko.wikipedia.org/wiki/대한민국_제19대_국회의원_목록',
  after: "//h2/span[.='가나다순 보기']",
  before: "//h2/span[.='의석 변동']",
  xpath: '//p//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { ko: names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder

