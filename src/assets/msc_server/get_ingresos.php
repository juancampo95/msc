<?php 

require("./conexion.php");

class showData extends conexion{
	public function __construct($tabla){
		parent :: __construct();
			$pedido = json_decode(file_get_contents("php://input"));
			if(isset($pedido)){
				$id_resumen = mysqli_real_escape_string($this->conexion,$pedido->id);
				$usuario = mysqli_real_escape_string($this->conexion,$pedido->usuario);
				$output = array();
				$query  = "SELECT * FROM $tabla WHERE id_resumen = '$id_resumen'";
				$result = mysqli_query($this->conexion,$query);

					if(mysqli_num_rows($result)>0){
						while ($row = mysqli_fetch_array($result)){
							$output[] = $row;
						}
						echo json_encode($output);	

					}else{
						echo json_decode("{'status':'Error no hay ingresos'".mysqli_error($this->conexion)."}");
					}
			}
			
		}
	}
	$mostrarCliente = new showData("otrosingresos_tb");
 ?>