<?php 
	header('Access-Control-Allow-Origin: *');
	require("../conexion.php");

	class Login extends conexion {

		public function __construct($tabla){

			parent::__construct();
			$data = json_decode(file_get_contents("php://input"));

			if(isset($data)>0){
				// obtengo datos de fomulario de sesion
				$username = mysqli_real_escape_string($this->conexion,$data->username);
				$pass = mysqli_real_escape_string($this->conexion,$data->password);
				// validacion de datos con base de datos
				$query = "SELECT * FROM $tabla WHERE username = '$username' and password = '$pass'";
				$result = mysqli_query($this->conexion,$query);
				// si hay un resultado entonces
				if(mysqli_num_rows($result)>0){
					$row = mysqli_fetch_array($result);

					$key_access = $this->generarCodigo(20);//creo condigo de sesion para el usuario
					$queryKey = "UPDATE $tabla SET key_access = '$key_access' WHERE username = '$username' and password = '$pass'";//y se lo asigno
					
					//si todo está correcto, envio la respuesta positiva 
					if(mysqli_query($this->conexion,$queryKey)){
						$respuesta = 
							array(
								'status'=>'1',
								'error'=>mysqli_error($this->conexion),
								'rol'=>$row['rol'],
								'username'=>$row['username'],
								'key'=>$key_access
							);
						echo json_encode($respuesta);	
					}else{//sino la negativa
						$respuesta = 
							array(
								'status'=>'02',
								'error'=>mysqli_error($this->conexion)
							);
						echo json_encode($respuesta);	
					}

				}else{	//si no hay ningun resultado con estos inputs del formulario entonces dar respuesta negativa
					$respuesta = array('status'=>'0','error'=>mysqli_error($this->conexion));
					echo json_encode($respuesta);	
				}
			}else{//si no llegan los datos del formulario entonces dar respuesta negativa
					$respuesta = array('status'=>'00','error'=>mysqli_error($this->conexion));
					echo json_encode($respuesta);	
			}
		}

		//metodo para crear codigo aleatorio de token
		public function generarCodigo($longitud) {
			 $key = '';
			 $pattern = '1234567890abcdefghijklmnopqrstuvwxyz';
			 $max = strlen($pattern)-1;
			 for($i=0;$i < $longitud;$i++) $key .= $pattern{mt_rand(0,$max)};
			 return $key;
		}

	}

	$login = new Login('usuarios_tb');
 ?>