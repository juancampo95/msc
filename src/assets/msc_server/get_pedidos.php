<?php 

require("./conexion.php");

class showData extends conexion{
	public function __construct($tabla){
		parent :: __construct();
		$output = array();
		$query  = "SELECT * FROM $tabla";
		$result = mysqli_query($this->conexion,$query);

			if(mysqli_num_rows($result)>0){
				while ($row = mysqli_fetch_array($result)){
					$output[] = $row;
				}
				echo json_encode($output);
				// echo "Se Mostraron";
			}else{
				echo "no funciono";
			}
		}
	}
	$mostrarCliente = new showData("pedidos_tb");
 ?>