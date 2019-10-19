<?php 

	require("./conexion.php");

	class insertar extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$pedido = json_decode(file_get_contents("php://input"));

			if(isset($pedido)){
				$id_resumen = mysqli_real_escape_string($this->conexion,$pedido->id_resumen);
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
				$usuario =mysqli_real_escape_string($this->conexion,$pedido->usuario);
				

				$query = "INSERT INTO $tabla (id_resumen,fecha,hora,cliente,documento,mesero,metodo,comentario,mesa,subtotal_p,total_p,descuento,productos,estado,usuario)
				VALUES 	('$id_resumen','$fecha','$hora','$cliente','$documento','$mesero','$metodo','$comentario','$mesa','$subtotal_p','$total_p','$descuento','$productos','$estado','$usuario')";
				if(mysqli_query($this->conexion,$query)){
					// print_r($productos);
					// echo "ingreso correctamente";

					$query2="SELECT id FROM $tabla WHERE fecha='$fecha'and hora='$hora' and total_p='$total_p'";
					$resulta = mysqli_query($this->conexion,$query2);
					// echo "respuesta :".$resulta;

					if(mysqli_num_rows($resulta)>0){
						while ($row = mysqli_fetch_array($resulta)){
							$output[] = $row;
						}
						echo json_encode($output);	
							// echo "Se Mostraron";
					}else{
							echo "no funciono";
					}

				}else{
					// echo json_decode("{'status':'Error en exitoso'".mysqli_error($this->conexion)."}");
					echo "Error ".mysqli_error($this->conexion);
					
				}
			}
		}
	}

	$clienteNuevo = new insertar("pedidos_tb");
 ?>