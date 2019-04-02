<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
	require("./conexion.php");

	class update extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$pedido  = json_decode(file_get_contents("php://input"));

			if(isset($pedido)){
				$fecha = mysqli_real_escape_string($this->conexion,$pedido->fecha);
				$hora = mysqli_real_escape_string($this->conexion,$pedido->hora);
				$cliente = mysqli_real_escape_string($this->conexion,$pedido->cliente);
				$documento = mysqli_real_escape_string($this->conexion,$pedido->documento);
				$mesero = mysqli_real_escape_string($this->conexion,$pedido->mesero);
				$metodo = mysqli_real_escape_string($this->conexion,$pedido->metodo);
				$comentario = mysqli_real_escape_string($this->conexion,$pedido->comentario);
				$mesa = mysqli_real_escape_string($this->conexion,$pedido->mesa);
				$subtotal_p = mysqli_real_escape_string($this->conexion,$pedido->subtotal_p);
				$total_p = mysqli_real_escape_string($this->conexion,$pedido->total_p);
				$descuento = mysqli_real_escape_string($this->conexion,$pedido->descuento);
				$estado = mysqli_real_escape_string($this->conexion,$pedido->estado);
				$productos =json_encode($pedido->productos);
				
				$id = $pedido->id;
				$query = "UPDATE $tabla SET 
				fecha = '$fecha',
				hora = '$hora',
				cliente = '$cliente',
				documento = '$documento',
				mesero = '$mesero',
				metodo = '$metodo',
				comentario = '$comentario',
				mesa = '$mesa',
				subtotal_p = '$subtotal_p',
				total_p = '$total_p',
				descuento = '$descuento',
				productos = '$productos',
				estado = '$estado' WHERE id = '$id'";
				if(mysqli_query($this->conexion,$query)){
					// echo json_decode("{'status':'Empleado Actualizado'}");
					echo "El pedido fue actualizado correctamente";

				}else{
					// echo json_decode("{'status':'Error en exitoso'".mysqli_error($this->conexion)."}");
					echo "Error ".mysqli_error($this->conexion);
				};
				
			}
		}
	}

	$clienteNuevo = new update("pedidos_tb");
 ?>