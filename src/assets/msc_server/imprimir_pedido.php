<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
	require("./conexion.php");

	require __DIR__ . '/prints/autoload.php'; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
	use Mike42\Escpos\Printer;
	use Mike42\Escpos\EscposImage;
	use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


	class PrintPedido extends conexion{
		var $fecha;
		var $hora;
		var $cliente;
		var $documento;
		var $mesero;
		var $metodo;
		var $comentario;
		var $mesa;
		var $subtotal_p;
		var $total_p;
		var $descuento;
		var $devuelve;
		var $pagadocon;
		var $estado;
		var $productos;
		var $id;

		public function __construct($tabla){
			parent::__construct();

			$pedido  = json_decode(file_get_contents("php://input"));

			if(isset($pedido)){
				$this->fecha = mysqli_real_escape_string($this->conexion,$pedido->fecha);
				$this->hora = mysqli_real_escape_string($this->conexion,$pedido->hora);
				$this->cliente = mysqli_real_escape_string($this->conexion,$pedido->cliente);
				$this->documento = mysqli_real_escape_string($this->conexion,$pedido->documento);
				$this->mesero = mysqli_real_escape_string($this->conexion,$pedido->mesero);
				$this->metodo = mysqli_real_escape_string($this->conexion,$pedido->metodo);
				$this->comentario = mysqli_real_escape_string($this->conexion,$pedido->comentario);
				$this->mesa = mysqli_real_escape_string($this->conexion,$pedido->mesa);
				$this->subtotal_p = mysqli_real_escape_string($this->conexion,$pedido->subtotal_p);
				$this->total_p = mysqli_real_escape_string($this->conexion,$pedido->total_p);
				$this->descuento = mysqli_real_escape_string($this->conexion,$pedido->descuento);
				$this->estado = mysqli_real_escape_string($this->conexion,$pedido->estado);
				$this->productos =json_encode($pedido->productos);
				$this->id = $pedido->id;

				$this->imprimirPedido($pedido);
			}
		}

		public function imprimirPedido($pedido){
				$nombre_impresora = "POS-58"; 
				$connector = new WindowsPrintConnector($nombre_impresora);
				$printer = new Printer($connector);
				// $printer->pulse();
			// // IMPRIMIR DE TICKET
					$printer->setJustification(Printer::JUSTIFY_CENTER);
					try{
						$logo = EscposImage::load("./imgs/logo.png", false);
						$printer->setJustification(Printer::JUSTIFY_CENTER);
					    $printer->bitImage($logo);
					}catch(Exception $e){}

					$printer->text("-------------------------------\n");
					$printer->text("PEDIDO FACTURA No ".$this->id."\n");
					$printer->text("-------------------------------\n");

					#La fecha también
					date_default_timezone_set("America/Bogota");
					$printer->text(date("Y-m-d H:i:s")."\n");
					$printer->text("Atendido por: ".$this->mesero."- Mesa: ".$this->mesa."\n");
					
					if($this->cliente !== ""){
						$printer->text("Cliente: ".$this->cliente."\n");
					}else{
						$printer->text("\n");
					}
					$printer->text("-------------------------------\n");
					$printer->setJustification(Printer::JUSTIFY_LEFT);
					$printer->text("CANT    ITEM     PRECIO   TOTAL\n");
					$printer->text("-------------------------------\n");

						/*Alinear a la izquierda para la cantidad y el nombre*/
					

					// imprimir productos
					for($i=0;count($pedido->productos)>$i;$i++){
						$printer->setJustification(Printer::JUSTIFY_LEFT);
						$printer->text(" ".$pedido->productos[$i]->cantidad." - ".$pedido->productos[$i]->nombre."\n");
						$printer->setJustification(Printer::JUSTIFY_RIGHT);
						$printer->text("             $".number_format($pedido->productos[$i]->v_unidad)." - $".number_format($pedido->productos[$i]->v_total)."\n");
					}

					$printer->setJustification(Printer::JUSTIFY_LEFT);
					$printer->text("TOTAL: $".number_format($this->total_p)."\n");
					$printer->text("-------------------------------"."\n");
					$printer->text("Nota: ".$this->comentario."\n");
					$printer->feed(3);
					$printer->cut();

					
					$printer->close();
					// IMPRIMIR DE TICKET
		}
	}

	$clienteNuevo = new PrintPedido("pedidos_tb");
 ?>