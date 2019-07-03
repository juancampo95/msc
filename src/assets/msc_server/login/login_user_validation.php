<?php 
require("../conexion.php");

class Validacion extends conexion{
	
	function __construct($tabla){
		parent::__construct();
		$data = json_decode(file_get_contents("php://input"));


		if(isset($data)){
			$username = mysqli_real_escape_string($this->conexion,$data->username);
			$key = mysqli_real_escape_string($this->conexion,$data->key);			


			$sql = "SELECT * FROM $tabla WHERE username = '$username' and key_access = '$key'";
			$result=$this->conexion->query($sql);

			if($result-> num_rows>0){
				$row = $result-> fetch_assoc();
				$respuesta = array('status'=>'autenticado','rol'=>$row['rol'],'username'=>$row['username'],'username'=>$row['key_access']);
				echo json_encode($respuesta);	
			}else{
				$respuesta = array('status'=>'00');
				echo json_encode($respuesta);	
			}
		}else{	
				$respuesta = array('status'=>'0');
				echo json_encode($respuesta);
		}
	}	
}
	$validacion= new Validacion("usuarios_tb");
 ?>