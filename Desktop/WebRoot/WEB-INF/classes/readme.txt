应用名称：智能机器人
实现：在index.jsp中提供界面，与用户沟通。用户发出一句话，传至Robot类，调用网络接口，返回数据，再传至页面显示

不足：在main方法中调用，没有乱码。在dopost()方法中，返回的值出现乱码情况
网络接口：Robot类直接URL请求网络地址，返回信息
      index.jsp中请求百度语言合成接口，略麻烦  看文档3.4
百度语音合成接口URL:https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=R6UwD9ELRg1RxImTO35sOGIA&client_secret=b29a6d60e46e841a111d9066c6d0321c&
注：url中不可有回车
