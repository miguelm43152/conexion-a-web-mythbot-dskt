var express = require("express");
var mysql = require("mysql");
const bcrypt = require('bcrypt');

var app = express();
app.use(express.json());
const PORT = 8080;
const urlLogin = "/login";
const urlLogup = "/logup";

const con = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"",
	database:"usuarios"
})// fin de constructor objeto con

con.connect((err)=>{
	if(err){
		console.log(err)
	}else{
		console.log("Connected!!!")
	}
})// fin de funcion connect para conectar con la base de datos


app.post(urlLogup,(req,res)=>{

    // recibe el objeto json req y lo guarda en variables

	var usuario = req.body.usuario
	var pass = req.body.pass
	var edad = req.body.edad

    // constante salt necesaria para usar bcrypt
	const salt = 10;

    bcrypt.genSalt(salt, function(err, salt) {
        bcrypt.hash(pass, salt, function(err, hash) {
            // Store hash in your password DB.
        	console.log(hash);
        	con.query("INSERT INTO `usuariosregistrados`(`Usuario`, `Password`, `Edad`) VALUES (?,?,?)",[usuario,hash,edad],(e,resultado)=>{
				if(e){
					console.error(e);
					res.send("hubo un error");
				}
				else{
					console.log("todo bien");
					res.send("No hubo un error");
				}				
			})// fin de con.query

        });
    });
	
})//fin de post Logup

app.post(urlLogin,(req,res)=>{

	var usuario = req.body.usuario
	var pass = req.body.pass

		con.query("SELECT * FROM `usuariosregistrados` WHERE `Usuario`= ? ",[usuario],(e,resultado)=>{
			if(e){
				console.log(e)
			}else{
				
				if(!Object.keys(resultado).length){
     				console.log("no se encontro");
     				console.log(res);
     				res.send("usuario o password incorrecto1");
 				}else{
 					//console.log("bienvenido !!!!!!!!!!");
 					//console.log(resultado);
 					//console.log(resultado[0]);
 					
 					const hash = resultado[0].Password;

 					console.log( typeof hash );
 					
 					    bcrypt.compare(pass, hash, function(err, result) {
					        // result == true
					        //console.log("funcion comparar");
					        console.log(result);
					        if(result){
								res.send("bienvenido");
					        }else{
								res.send("usuario o password incorrecto2");
					        }
					        //process.exit(0);
					    });
 					
 				}
			}
		})// fin de con.query
	
})//fin de post Login

app.listen(PORT,(err) => {
	if(err){
		console.log(err)
	}else{
		console.log("conectado en puerto "+ PORT + "!!!")
	}
})// inicializacion de servidor
