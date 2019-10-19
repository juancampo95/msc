<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
	
	require("./conexion.php");

	class update extends conexion{
		public $funcion;
		public $pedido;
		
		public function __construct($tabla){
			parent::__construct();
			$this->pedido = json_decode(file_get_contents("php://input"));
			$this->funcion = $_GET['funcion'];
			$this->Actualizar($tabla);

		}

		// METODOS PARA FUNCIONES DE BALANCE GENERAL
		public function Actualizar($tabla){
			if(isset($this->pedido)){
				switch ($this->funcion){
					case 'base_inicial':
							echo "Si lee el param";
							$this->soloBaseInicial($tabla);
						break;
					case 'post_ingresos':
								echo "Si lee el param";
								$this->postIngresos('otrosingresos_tb');

						break;					
					case 'actualizar_ingreso':
								$this->updateIngresos('otrosingresos_tb');
						break;					
					case 'eliminar_ingreso':
								echo "Si lee el param";
								$this->deleteIngresos('otrosingresos_tb');
						break;	

					case 'post_gasto':
								echo "Si lee el param";
								$this->postGasto('gastos_y_vales');
						break;	

					case 'actualizar_gasto':
								echo "Si lee el param";
								$this->updateGasto('gastos_y_vales');
						break;

					case 'eliminar_gastos':
								echo "Si lee el param de gasots";
								$this->deleteGastos('gastos_y_vales');
						break;	

					case 'cuadrar_resumen':
								// echo "Si lee el parametro de cuadre de resumen";
								$this->cuadrarResumen($tabla);
						break;		
					case 'guardarArqueo':
								// echo "Si lee el parametro de cuadre de resumen";
								$this->guardarArqueo($tabla);
						break;		
					default:
							echo "respuesta default de switch case";
						break;
				}
			}
		}

		//solo va a actualizar la base inicial del resumen actual
		public function soloBaseInicial($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$base_i_b = mysqli_real_escape_string($this->conexion,$this->pedido->base_i_b);
			$base_i_m = mysqli_real_escape_string($this->conexion,$this->pedido->base_i_m);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$query = "UPDATE $tabla SET base_i_b = '$base_i_b',	base_i_m = '$base_i_m' WHERE id = '$id' AND usuario = '$usuario'";
				if(mysqli_query($this->conexion,$query)){
					echo "El resumen fue guardado";
				}else{
					echo "Error ".mysqli_error($this->conexion);
				};
		}
		public function guardarArqueo($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$billetes_a = mysqli_real_escape_string($this->conexion,$this->pedido->billetes_a);
			$monedas_a = mysqli_real_escape_string($this->conexion,$this->pedido->monedas_a);
			$datafono_a = mysqli_real_escape_string($this->conexion,$this->pedido->datafono_a);
			$online_a = mysqli_real_escape_string($this->conexion,$this->pedido->online_a);

			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$query = "UPDATE $tabla SET 
				billetes_a = '$billetes_a',
 				monedas_a = '$monedas_a',
 				datafono_a = '$datafono_a',
 				online_a  = '$online_a'WHERE id = '$id' AND usuario = '$usuario'";
				if(mysqli_query($this->conexion,$query)){
					echo "Arqueo actualizado";
				}else{
					echo "Error ".mysqli_error($this->conexion);
				};
		}

		public function cuadrarResumen($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);

			$fecha_fin = mysqli_real_escape_string($this->conexion,$this->pedido->fecha_fin);
			$hora_fin = mysqli_real_escape_string($this->conexion,$this->pedido->hora_fin);

			$pedidos_facturados = mysqli_real_escape_string($this->conexion,$this->pedido->pedidos_facturados);
			$datafono = mysqli_real_escape_string($this->conexion,$this->pedido->datafono);
			$online = mysqli_real_escape_string($this->conexion,$this->pedido->online);
			$otros_ingresos = mysqli_real_escape_string($this->conexion,$this->pedido->otros_ingresos);
			$total_ingresos = mysqli_real_escape_string($this->conexion,$this->pedido->total_ingresos);

			$compras_gastos = mysqli_real_escape_string($this->conexion,$this->pedido->compras_gastos);
			$vales = mysqli_real_escape_string($this->conexion,$this->pedido->vales);
			$total_gastos = mysqli_real_escape_string($this->conexion,$this->pedido->total_gastos);

			$total_resumen = mysqli_real_escape_string($this->conexion,$this->pedido->total_resumen);

			$billetes_a = mysqli_real_escape_string($this->conexion,$this->pedido->billetes_a);
			$monedas_a = mysqli_real_escape_string($this->conexion,$this->pedido->monedas_a);
			$datafono_a = mysqli_real_escape_string($this->conexion,$this->pedido->datafono_a);
			$online_a = mysqli_real_escape_string($this->conexion,$this->pedido->online_a);
			$total_arqueo = mysqli_real_escape_string($this->conexion,$this->pedido->total_arqueo);

			$descuadre = mysqli_real_escape_string($this->conexion,$this->pedido->descuadre);
			$cuadrado = mysqli_real_escape_string($this->conexion,$this->pedido->cuadrado);


			$query = "UPDATE $tabla SET
				fecha_fin = '$fecha_fin',
				hora_fin = '$hora_fin',

 				pedidos_facturados = '$pedidos_facturados',
 				datafono = '$datafono',
 				online = '$online',
 				otros_ingresos = '$otros_ingresos',
 				total_ingresos = '$total_ingresos',

 				compras_gastos = '$compras_gastos',
 				vales = '$vales',
 				total_gastos = '$total_gastos',
 				total_resumen = '$total_resumen',
 				billetes_a = '$billetes_a',
 				monedas_a = '$monedas_a',
 				datafono_a = '$datafono_a',
 				online_a  = '$online_a',
 				total_arqueo = '$total_arqueo',
 				descuadre = '$descuadre',
 				cuadrado = '$cuadrado' WHERE id = '$id' AND usuario = '$usuario'";
				if(mysqli_query($this->conexion,$query)){
					echo "cuadre exitoso";
				}else{
					echo "Error ".mysqli_error($this->conexion);
				};
		}

		public function postIngresos($tabla){
			$id_r = mysqli_real_escape_string($this->conexion,$this->pedido->id_resumen);
			$fecha = mysqli_real_escape_string($this->conexion,$this->pedido->fecha);
			$detalle = mysqli_real_escape_string($this->conexion,$this->pedido->detalle);
			$total = mysqli_real_escape_string($this->conexion,$this->pedido->total);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$querypost = "INSERT into $tabla (id_resumen,fecha,detalle,total,usuario) VALUES ('$id_r','$fecha','$detalle','$total','$usuario')";

			if(mysqli_query($this->conexion,$querypost)){
					echo "ingreso correctamente";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
		}

		public function updateIngresos($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$id_r = mysqli_real_escape_string($this->conexion,$this->pedido->id_resumen);
			$fecha = mysqli_real_escape_string($this->conexion,$this->pedido->fecha);
			$detalle = mysqli_real_escape_string($this->conexion,$this->pedido->detalle);
			$total = mysqli_real_escape_string($this->conexion,$this->pedido->total);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$querypost = "UPDATE $tabla SET fecha = '$fecha', detalle = '$detalle', total = '$total' WHERE id = '$id'";

			if(mysqli_query($this->conexion,$querypost)){
					echo "actualizó";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
			
		}

		public function deleteIngresos($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$querypost = "DELETE FROM $tabla WHERE id = '$id'";

			if(mysqli_query($this->conexion,$querypost)){
					echo "se eliminó";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
		}

		public function postGasto($tabla){
			$id_r = mysqli_real_escape_string($this->conexion,$this->pedido->id_resumen);
			$fecha = mysqli_real_escape_string($this->conexion,$this->pedido->fecha);
			$detalle = mysqli_real_escape_string($this->conexion,$this->pedido->detalle);
			$tipo = mysqli_real_escape_string($this->conexion,$this->pedido->tipo);
			$total = mysqli_real_escape_string($this->conexion,$this->pedido->total);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$querypost = "INSERT into $tabla (id_resumen,fecha,detalle,tipo,total,usuario) VALUES ('$id_r','$fecha','$detalle','$tipo','$total','$usuario')";

			if(mysqli_query($this->conexion,$querypost)){
					echo "ingreso correctamente";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
		}

		public function updateGasto($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$id_r = mysqli_real_escape_string($this->conexion,$this->pedido->id_resumen);
			$fecha = mysqli_real_escape_string($this->conexion,$this->pedido->fecha);
			$tipo = mysqli_real_escape_string($this->conexion,$this->pedido->tipo);
			$detalle = mysqli_real_escape_string($this->conexion,$this->pedido->detalle);
			$total = mysqli_real_escape_string($this->conexion,$this->pedido->total);
			$usuario = mysqli_real_escape_string($this->conexion,$this->pedido->usuario);
			$querypost = "UPDATE $tabla SET fecha = '$fecha', detalle = '$detalle', tipo = '$tipo', total = '$total' WHERE id = '$id'";

			if(mysqli_query($this->conexion,$querypost)){
					echo "actualizó";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
			
		}
		public function deleteGastos($tabla){
			$id = mysqli_real_escape_string($this->conexion,$this->pedido->id);
			$querypost = "DELETE FROM $tabla WHERE id = '$id'";

			if(mysqli_query($this->conexion,$querypost)){
					echo "se eliminó";
			}else{
				echo "Error ".mysqli_error($this->conexion);
			}
		}

	}

	$clienteNuevo = new update("balances_diarios");












































// <!--  				$fecha_ini = mysqli_real_escape_string($this->conexion,$pedido->fecha_ini);
// 				$hora_ini = mysqli_real_escape_string($this->conexion,$pedido->hora_ini);
// 				$fecha_fin = mysqli_real_escape_string($this->conexion,$pedido->fecha_fin);
// 				$hora_fin = mysqli_real_escape_string($this->conexion,$pedido->hora_fin);
// 				$usuario = mysqli_real_escape_string($this->conexion,$pedido->usuario);
// 				$base_i_b = mysqli_real_escape_string($this->conexion,$pedido->base_i_b);
// 				$base_i_m = mysqli_real_escape_string($this->conexion,$pedido->base_i_m);
// 				$pedidos_facturados = mysqli_real_escape_string($this->conexion,$pedido->pedidos_facturados);
// 				$datafono = mysqli_real_escape_string($this->conexion,$pedido->datafono);
// 				$online = mysqli_real_escape_string($this->conexion,$pedido->online);
// 				$otros_ingresos = mysqli_real_escape_string($this->conexion,$pedido->otros_ingresos);
// 				$total_ingresos = mysqli_real_escape_string($this->conexion,$pedido->total_ingresos);
// 				$compras_gastos = mysqli_real_escape_string($this->conexion,$pedido->compras_gastos);
// 				$vales = mysqli_real_escape_string($this->conexion,$pedido->vales);
// 				$total_gastos = mysqli_real_escape_string($this->conexion,$pedido->total_gastos);
// 				$total_resumen = mysqli_real_escape_string($this->conexion,$pedido->total_resumen);
// 				$billetes_a = mysqli_real_escape_string($this->conexion,$pedido->billetes_a);
// 				$monedas_a = mysqli_real_escape_string($this->conexion,$pedido->monedas_a);
// 				$datafono_a = mysqli_real_escape_string($this->conexion,$pedido->datafono_a);
// 				$online_a = mysqli_real_escape_string($this->conexion,$pedido->online_a);
// 				$total_arqueo = mysqli_real_escape_string($this->conexion,$pedido->total_arqueo);
// 				$descuadre = mysqli_real_escape_string($this->conexion,$pedido->descuadre);
// 				$cuadrado = mysqli_real_escape_string($this->conexion,$pedido->cuadrado); -->
// <!-- 
// 				$id = $pedido->id;
// 				$query = "UPDATE $tabla SET 
// 				fecha_ini = '$fecha_ini',
// 				hora_ini = '$hora_ini',
// 				fecha_fin = '$fecha_fin',
// 				hora_fin = '$hora_fin',
// 				base_i_b = '$base_i_b',
// 				base_i_m = '$base_i_m',
// 				pedidos_facturados = '$pedidos_facturados',
// 				datafono = '$datafono',
// 				online = '$online',
// 				otros_ingresos = '$otros_ingresos',
// 				compras_gastos = '$compras_gastos',
// 				vales = '$vales',
// 				total_gastos = '$total_gastos',
// 				total_resumen = '$total_resumen',
// 				billetes_a = '$billetes_a',
// 				monedas_a = '$monedas_a',
// 				datafono_a = '$datafono_a',
// 				online_a  = '$online_a',
// 				total_arqueo = '$total_arqueo',
// 				descuadre = '$descuadre',
// 				cuadrado = '$cuadrado' WHERE id = '$id' AND usuario = '$usuario'";
// 				if(mysqli_query($this->conexion,$query)){
// 					// echo json_decode("{'status':'Empleado Actualizado'}");
// 					echo "El resumen fue guardado";

// 				}else{
// 					// echo json_decode("{'status':'Error en exitoso'".mysqli_error($this->conexion)."}");
// 					echo "Error ".mysqli_error($this->conexion);
// 				}; 
?>