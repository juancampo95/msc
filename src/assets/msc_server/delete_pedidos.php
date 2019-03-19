<?php 	
	require("./conexion.php");

	class eliminar extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$data = json_decode(file_get_contents("php://input"));
			
			if(count($data)>0){
				$id = $data;
				
				$query = "DELETE FROM $tabla WHERE id = '$id'";
				if(mysqli_query($this->conexion,$query)){
					echo "El pedido fue eliminado correctamente";
				}else{
					echo "Error ".mysqli_error($this->conexion);
				}
			}
		}
	}
	$eliminarObra = new eliminar("pedidos_tb");

 ?>