<?php 

require("./conexion.php");

class showData extends conexion{
	public function __construct($tabla){
		parent :: __construct();
		$user = $_GET['user'];
		$id = $_GET['id'];
		(int)$id;
		$output = array();
		$query  = "SELECT * FROM $tabla WHERE usuario = '$user' and id_resumen = '$id'";
		$result = mysqli_query($this->conexion,$query);

			if(mysqli_num_rows($result)>0){
				while ($row = mysqli_fetch_array($result)){
					$output[] = $row;
				}
				echo json_encode($output);
				// echo $id;
				// echo "Se Mostraron";
			}else{
				echo json_decode("{'status':'Error no hay pedidos'".mysqli_error($this->conexion)."}");
			}
		}
	}
	$mostrarCliente = new showData("pedidos_tb");
 ?>