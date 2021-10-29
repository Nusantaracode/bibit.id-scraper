
#  bibit.id-scraper
[![Trigger aum](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20aum.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20aum.yml)
[![Trigger chart](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20chart.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20chart.yml)
[![Trigger dividends](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20dividends.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20dividends.yml)
[![Trigger factsheets](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20factsheets.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20factsheets.yml)
[![Trigger list](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20list.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20list.yml)
[![Trigger product](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20product%20.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20product%20.yml)
[![Trigger prospectus](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20prospectus.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20prospectus.yml)
[![Trigger simulation](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20simulation.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20simulation.yml)
[![Trigger switchables](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20switchables.yml/badge.svg)](https://github.com/rahadiana/bibit.id-scraper/actions/workflows/cron%20switchables.yml)


A nodejs script to Scrape reksadana list on bibit.id.

To Clone This Repo :

    git clone https://github.com/rahadiana/bibit.id-scraper.git

This Script using "cache" as default folder value for scraping result , You can change default folder value for result scraping in

> **ReksadanaInfo.js (SaveFolder  =  "cache/")**
> **AND**
> **index.sh (FolderName="cache")**

Avaliable Method :

 1. list (to get avaliable list Reksadana).
 2. product (to get product info Reksadana).
 3. prospectus (to get prospectus info Reksadana).
 4. factsheets (to get factsheets info Reksadana).
 5. simulation (to get simulation info Reksadana).
 6. chart (to get chart info Reksadana).
 7. aum (to get aum info Reksadana).
 8. dividends (to get dividends info Reksadana).
 9. switchables (to get switchables info Reksadana).

Example Method:


 1. list (to get avaliable list Reksadana).
 

    node ReksadanaInfo.js list (page)

    node ReksadanaInfo.js list 1

 2. product (to get product info Reksadana).
 

     node ReksadanaInfo.js product (product code)

     node ReksadanaInfo.js product RD3191

 3. prospectus (to get prospectus info Reksadana).
 

    node ReksadanaInfo.js prospectus (product code)

    node ReksadanaInfo.js prospectus RD3191

 4. factsheets (to get factsheets info Reksadana).
 

    node ReksadanaInfo.js factsheets (product code)

    node ReksadanaInfo.js factsheets RD68

 5. simulation (to get simulation info Reksadana).

     node ReksadanaInfo.js simulation (product code)

     node ReksadanaInfo.js simulation RD68

 6. chart (to get chart info Reksadana).

     node ReksadanaInfo.js chart (product code) (peroid)

     node ReksadanaInfo.js chart RD68 1y

 7. aum (to get aum info Reksadana).

    node ReksadanaInfo.js aum (product code) (peroid)

    node ReksadanaInfo.js aum RD68 1y

 8. dividends (to get dividends info Reksadana).

     node ReksadanaInfo.js dividends  (product code)

     node ReksadanaInfo.js dividends RD68

 9. switchables (to get switchables info Reksadana).

     node ReksadanaInfo.js switchables (product code)

     node ReksadanaInfo.js switchables RD68


*for peroid  method  "chart & aum" you can choose :

1D,1M,3M,YTD,1Y,3Y,5Y,10Y,ALL
 
 for automatic scraping all method, you can use index.sh and uncomment a function / all functions

    bash index.sh

If you use index.sh, you machine must installed jq package

you can install jq package using (i'm use ubuntu):

     sudo apt install jq
