 <?php 

	require("./conexion.php");

	class insertar extends conexion{
		public function __construct($tabla){
			parent::__construct();

			$pedido = json_decode(file_get_contents("php://input"));

			if(isset($pedido)){
				$fecha_ini = mysqli_real_escape_string($this->conexion,$pedido->fecha_ini);
				$hora_ini = mysqli_real_escape_string($this->conexion,$pedido->hora_ini);
				$fecha_fin = mysqli_real_escape_string($this->conexion,$pedido->fecha_fin);
				$hora_fin = mysqli_real_escape_string($this->conexion,$pedido->hora_fin);
				$usuario = mysqli_real_escape_string($this->conexion,$pedido->usuario);
				$base_i_b = mysqli_real_escape_string($this->conexion,$pedido->base_i_b);
				$base_i_m = mysqli_real_escape_string($this->conexion,$pedido->base_i_m);
				$pedidos_facturados = mysqli_real_escape_string($this->conexion,$pedido->pedidos_facturados);
				$datafono = mysqli_real_escape_string($this->conexion,$pedido->datafono);
				$online = mysqli_real_escape_string($this->conexion,$pedido->online);
				$otros_ingresos = mysqli_real_escape_string($this->conexion,$pedido->otros_ingresos);
				$total_ingresos = mysqli_real_escape_string($this->conexion,$pedido->total_ingresos);
				$compras_gastos = mysqli_real_escape_string($this->conexion,$pedido->compras_gastos);
				$vales = mysqli_real_escape_string($this->conexion,$pedido->vales);
				$total_gastos = mysqli_real_escape_string($this->conexion,$pedido->total_gastos);
				$total_resumen = mysqli_real_escape_string($this->conexion,$pedido->total_resumen);
				$billetes_a = mysqli_real_escape_string($this->conexion,$pedido->billetes_a);
				$monedas_a = mysqli_real_escape_string($this->conexion,$pedido->monedas_a);
				$datafono_a = mysqli_real_escape_string($this->conexion,$pedido->datafono_a);
				$online_a = mysqli_real_escape_string($this->conexion,$pedido->online_a);
				$total_arqueo = mysqli_real_escape_string($this->conexion,$pedido->total_arqueo);
				$descuadre = mysqli_real_escape_string($this->conexion,$pedido->descuadre);
				$cuadrado = mysqli_real_escape_string($this->conexion,$pedido->cuadrado);
				

				$query = "INSERT INTO $tabla 
				(
					fecha_ini,
					hora_ini,
					fecha_fin,
					hora_fin,
					usuario,
					base_i_b,
					base_i_m,
					pedidos_facturados,
					datafono,
					online,
					otros_ingresos,
					total_ingresos,
					compras_gastos,
					vales,
					total_gastos,
					total_resumen,
					billetes_a,
					monedas_a,
					datafono_a,
					online_a,
					total_arqueo,
					descuadre,
					cuadrado
				)
				VALUES ('$fecha_ini',
					'$hora_ini',
					'$fecha_fin',
					'$hora_fin',
					'$usuario',
					'$base_i_b',
					'$base_i_m',
					'$pedidos_facturados',
					'$datafono',
					'$online',
					'$otros_ingresos',
					'$total_ingresos',
					'$compras_gastos',
					'$vales',
					'$total_gastos',
					'$total_resumen',
					'$billetes_a',
					'$monedas_a',
					'$datafono_a',
					'$online_a',
					'$total_arqueo',
					'$descuadre',
					'$cuadrado')";
		
				if(mysqli_query($this->conexion,$query)){
					echo "ingreso correctamente";

				}else{
					echo "Error ".mysqli_error($this->conexion);
					
				}
			}
		}
	}

	$clienteNuevo = new insertar("balances_diarios");
 ?>