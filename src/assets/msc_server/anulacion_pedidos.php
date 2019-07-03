<?php 	
	require("./conexion.php");

	class eliminar extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$data = json_decode(file_get_contents("php://input"));
			
			if(count($data)>0){
				$id = mysqli_real_escape_string($this->conexion,$data->id);
				$estado = mysqli_real_escape_string($this->conexion,$data->estado);
				
				$query = "UPDATE $tabla set estado = '$estado' WHERE id = '$id'";
				if(mysqli_query($this->conexion,$query)){
					echo "El pedido actualizado ".$estado;
				}else{
					echo "Error ".mysqli_error($this->conexion);
				}
			}
		}
	}
	$eliminarObra = new eliminar("pedidos_tb");

 ?>