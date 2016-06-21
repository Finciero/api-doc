---
title: API Doc

language_tabs:
  - shell: curl
  - ruby
  - javascript
  - go

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - authentication
  - sub_accounts
  - transactions
  - errors

search: true
---

# Introduction

Finciero's API is built around REST, making it predictable and easy to use.
Our API responses make strong use of HTTP status codes in order to
identify multiple kind of errors. Also, all our responses are JSON objects,
including our errors.

We plan to have SDKs for multiple languages, like ruby, golang and nodejs,
this will make the comunication between your application and our API easier.

Currently our API works as follows:

- Client requests the SubAccount list.
- The API responds that the scraping process has started.

After the last point, the client has no more to do, the scraping process is
working asynchronously, so you can expect to receive the data, at most, 30 seconds
after the scraping started. When the API receives the requested data from
our scraping internal service, wether it has been successfully scraped or not,
the information is sent to a URL specified by the client, knowns as **callbacks**.

The following sequence diagram explains the above process:

![Sequence Diagram, Scrape Sub Accounts](sub_accounts_sd_en.png)

When requesting transactions, it can take from 30 seconds to 2 minutes, depending
on how many transactions the scraped accounts has.

![Sequence Diagram, Scrape Transactions](transactions_sd_en.png)
