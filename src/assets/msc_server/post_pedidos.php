<?php 

	require("./conexion.php");

	class insertar extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$pedido = json_decode(file_get_contents("php://input"));

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
				

				$query = "INSERT INTO $tabla (fecha,hora,cliente,documento,mesero,metodo,comentario,mesa,subtotal_p,total_p,descuento,productos,estado)
				VALUES 	('$fecha','$hora','$cliente','$documento','$mesero','$metodo','$comentario','$mesa','$subtotal_p','$total_p','$descuento','$productos','$estado')";
				if(mysqli_query($this->conexion,$query)){
					print_r($productos);
					echo "ingreso correctamente";
				}else{
					// echo json_decode("{'status':'Error en exitoso'".mysqli_error($this->conexion)."}");
					echo "Error ".mysqli_error($this->conexion);
					
				}

// 				if($btn_name == "Actualizar Datos"){
// 					$id = $pedido->id;
// 					$query = "UPDATE $tabla SET 
// 					fullname = '$ful',
// 					company = '$com',
// 					phone = '$ph',
// }
// 					fecha_modificacion = '$fechaActual' WHERE id = '$id'";

// 					if(mysqli_query($this->conexion,$query)){
// 						echo "Dato actualizado";
// 					}else{
// 						echo "falló la actualización";
// 					}
// 				}
			}
		}
	}

	$clienteNuevo = new insertar("pedidos_tb");
 ?>