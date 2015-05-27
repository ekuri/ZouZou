# ZOUZOU API documents


### Account App

| 功能 | 接口URL | 接口类型 | 必选项 | 可选项 | 响应类型 | 响应内容 |
|:---:|:------:|:-------:|:-----:|:-----:|:-----:|:-----:|
|登录页面|/account/login/|HTTP/GET|||HTTP/HTML|login.html|
|登录|/account/login/|HTTP/POST|username(string)<br>password(string)||REDIRECT|/|
|注册页面|/account/register/|HTTP/GET|||HTTP/HTML|register.html|
|注册|/account/register/|HTTP/POST|username(string)<br>password(string)<br>email(string)||REDIRECT|/|
|退出登录|/account/logout/|HTTP/GET|||REDIRECT|/|
|个人页面|/account/home/|HTTP/GET|||HTTP/HTML|home.html<br>...|
|修改资料页面|/account/edit/|HTTP/GET|||HTTP/HTML|edit.html<br>...|
|修改资料|/account/edit/|HTPP/POST||...|HTTP/JSON|result(boolean)<br>message(string)|

---------------

### Base App

| 功能 | 接口URL | 接口类型 | 必选项 | 可选项 | 响应类型 | 响应内容 |
|:---:|:------:|:-------:|:-----:|:-----:|:-----:|:-----:|
|首页|/|HTTP/GET|||HTTP/HTML|index.html<br>...|

-------------

### Comment App

| 功能 | 接口URL | 接口类型 | 必选项 | 可选项 | 响应类型 | 响应内容 |
|:---:|:------:|:-------:|:-----:|:-----:|:-----:|:-----:|
|发布评论|/comment/create/|HTTP/POST|travelItemID(string)<br>content(string)||HTTP/JSON|result(boolean)<br>message(string)<br>commentID(string)|
|获取评论|/comment/(?P<travelItemID>[0-9]+)/|HTTP/GET|||HTTP/JSON|result(boolean)<br>message(string)<br>comments(Array[Comment])|

---------------

### Travel App

| 功能 | 接口URL | 接口类型 | 必选项 | 可选项 | 响应类型 | 响应内容 |
|:---:|:------:|:-------:|:-----:|:-----:|:-----:|:-----:|
|开始旅行|/travel/start/|HTTP/POST|userID(int)||HTTP/JSON|result(boolean)<br>message(string)<br>travelID|
|结束旅行|/travel/end/|HTTP/POST|userID(int)||HTTP/JSON|result(boolean)<br>message(string)|
|旅行详情|/travel/detail/|HTTP/GET|||HTTP/HTML|travel.html<br>travelItems(Array[TravelItem])<br>...|

---------------

### Weixin App

| 功能 | 接口URL | 接口类型 | 必选项 | 可选项 | 响应类型 | 响应内容 |
|:---:|:------:|:-------:|:-----:|:-----:|:-----:|:-----:|
