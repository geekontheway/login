### Using Gems

devise

> 用户注册登陆

ahoy

> A solid foundation for analytics

foundation-rails modernizr-rails foundation_rails_helper font-awesome-rails

> 前端框架，图标

### 简单实现

1.使用ahoy统计当前页面访问用户，暂没有做成realtime获取登陆状态，以4小时内登录用户为当前在线用户

>By default, a new visit is created after 4 hours of inactivity.

visit可以和登陆user--对应起来，如果没有取到对应user, 则认为当前用户是一个陌生人

2.获取统计接口直接使用 render json的方式, 暂没有做跨域请求处理

