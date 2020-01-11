//获取根目录
var curWwwPath=window.document.location.href;
var pathName = window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var path=localhostPaht+projectName
//这里给所有ajax请求添加一个complete函数
$.ajaxSetup({
    complete: function (xhr, status) {
        //拦截器实现超时跳转到登录页面
        // 通过xhr取得响应头
        var REDIRECT = xhr.getResponseHeader("REDIRECT");
        //如果响应头中包含 REDIRECT 则说明是拦截器返回的
        if (REDIRECT == "REDIRECT") {
            var win = window;
            while (win != win.top) {
                win = win.top;
            }
            layer.closeAll()
            //重新跳转到登录页面
            isLogin(path)
        }
        if (REDIRECT == "USERREDIRECT") {
            var win = window;
            while (win != win.top) {
                win = win.top;
            }
            //重新跳转到登录页面
            isUserLogin(path)
        }
    }
});
// 管理员登录判断
function isLogin(path) {
    layer.open({
        type: 1,
        title: false,
        closeBtn: false,
        offset: '180px',
        area: '300px;',
        shade: 0.8,
        id: 'LAY_layuipro', //设定一个id，防止重复弹出
        resize: false,
        btn: ['登录'],
        skin: 'admTips',
        btnAlign: 'c',
        moveType: 1,//拖拽模式，0或者1
        content: '<div style="font-size:17px;padding: 20px 40px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;text-align:center">' +
        '<img src="'+path+'/images/admin/admError.png" style="width:36px;height:34px">' + '<br><br>' +
        '您当前状态为未登录，请登录再进行操作。</div>',
        success: function (layero) {
            var btn = layero.find('.layui-layer-btn');
            btn.find('.layui-layer-btn0').attr({
                href: path+'/page/admin/pages/admLogin.jsp'
            });
        }
    });
}
// 用户登录判断
function isUserLogin(path) {
    parent.layer.open({
        type: 1,
        title: false,
        closeBtn: false,
        offset: '180px',
        area: '300px;',
        shade: 0.8,
        id: 'LAY_layuipro', //设定一个id，防止重复弹出
        resize: false,
        btn: ['登录'],
        skin: 'admTips',
        btnAlign: 'c',
        moveType: 1,//拖拽模式，0或者1
        content: '<div style="font-size:17px;padding: 20px 40px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;text-align:center">' +
        '<img src="'+path+'/images/admin/admError.png" style="width:36px;height:34px">' + '<br><br>' +
        '您当前状态为未登录，请登录再进行操作。</div>',
        yes: function () {
            parent.layer.closeAll()
            parent.layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: [path+'/page/user/login.jsp', 'no'], //iframe的url，no代表不显示滚动条
            })
        }
    });
}