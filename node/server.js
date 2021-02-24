var fs = require("fs");
var http = require("http");
var os = require("os");
var ip = require("ip");

//Getting server uptime
var serverUptime = os.uptime();
let serverSeconds = (serverUptime / 1000);
let sdays = Math.floor(serverSeconds / 86400);
let shours = Math.floor(serverSeconds / 3600) - (sdays * 24);
serverSeconds %= 3600;
let sminutes = Math.floor(serverSeconds / 60);
let sseconds = Math.floor(serverSeconds % 60);
var serverUptimeCalc = `${sdays} days, ${shours} hours, ${sminutes} minutes and ${sseconds} seconds`;

//Getting total memory
var total_memory = os.totalmem();
var total_mem_in_kb = total_memory/1024; 
var total_mem_in_mb = total_mem_in_kb/1024; 

total_mem_in_mb = Math.floor(total_mem_in_mb); 

//Getting free memory
var free_memory = os.freemem(); 
var free_mem_in_kb = free_memory/1024; 
var free_mem_in_mb = free_mem_in_kb/1024; 

free_mem_in_mb = Math.floor(free_mem_in_mb); 

//Getting CPUs
var numberOfCPUs = os.cpus().length;

var server = http.createServer(function(req, res){
    if (req.url === "/" ) {
        fs.readFile("./public/index.html", "UTF-8", function(err, body){
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(body);
        })
    }

    else if(req.url.match("/sysinfo")) {
        myHostname =os.hostname();
        html =`
        <!DOCTYPE html>
        <head>
            <title>Node JS Response</title>
        </head>
        <body>
            <p>Hostname: ${myHostname}</p>
            <p>IP: ${ip.address()}</p>
            <p>Server Uptime: ${serverUptimeCalc}</p>
            <p>Total Memory: ${total_mem_in_mb}MB</p>
            <p>Free Memory: ${free_mem_in_mb}MB</p>
            <p>Number of CPUs: ${numberOfCPUs}</p>
        </body>
        </html>
        `

        res.writeHead(200, {"Content-Type" : "text/html"})
        res.end(html);
    }

    else{
        res.writeHead(404, {"Contet-Type":"text/plain"});
        res.end(`404 File Not Found at ${req.url}`);
    }
});

server.listen(3000);
console.log("Server listening on port 3000");