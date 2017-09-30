var WebSocketServer = require('ws').Server;

var WS = new WebSocketServer({
	port:8888
})

WS.on('connection', function(ws){
	console.log('client connected');
	    ws.on('message', function (message) {
        console.log(`[SERVER] Received: ${message} from client`);
        ws.send(`ECHO: ${message}`, (err) => {
            if (err) {
                console.log(`[SERVER] error: ${err}`);
            }
        });
    })
	//socket.onmessage = message;
	ws.onclose = close;
	ws.onerror = error;
	ws.onopen = open;
})


function message(msg){
	console.log(msg);
	ws.send("I received your message")
    //对接收到的消息做些什么
}
function error(err){
    //处理错误
}
function close(){
    //连接关闭时做些什么
}
function open(){
    //此链接开启后做些什么
}