<?php 

require("./conexion.php");

class showData extends conexion{
	public function __construct($tabla){
		parent :: __construct();
		$output = array();

		$username = $_GET['user'];

		$query  = "SELECT * FROM $tabla WHERE usuario = '$username' and cuadrado = 'no'";
		$result = mysqli_query($this->conexion,$query);

		if(mysqli_query($this->conexion,$query)){
			if(mysqli_num_rows($result)>0){
				while ($row = mysqli_fetch_array($result)){
					echo json_encode($row);
				}
			}else{
				echo json_decode("{'status':'no tiene resumen '".mysqli_error($this->conexion)."}");
			}
		}else{
			echo json_decode("{'status':'no funciona '".mysqli_error($this->conexion)."}");
		}
	}
}
	$mostrarCliente = new showData("balances_diarios");
 ?>