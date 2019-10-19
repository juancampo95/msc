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


	class update extends conexion{
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
				$this->pagadocon = mysqli_real_escape_string($this->conexion,$pedido->pagadocon);
				$this->devuelve = mysqli_real_escape_string($this->conexion,$pedido->devuelve);
				$this->productos =json_encode($pedido->productos);
				$this->id = $pedido->id;
				$this->imprimirFactura($pedido);
			}
		}

		public function imprimirFactura($pedido){
				$nombre_impresora = "POS-58"; 
				$connector = new WindowsPrintConnector($nombre_impresora);
				$printer = new Printer($connector);
				$printer->pulse();
			// // IMPRIMIR DE TICKET
					$printer->setJustification(Printer::JUSTIFY_CENTER);
					try{
						$logo = EscposImage::load("./imgs/logo.png", false);
						$printer->setJustification(Printer::JUSTIFY_CENTER);
					    $printer->bitImage($logo);
					}catch(Exception $e){}

					$printer->text("\n"."Mi Salsa Casera®"."\n");
					$printer->text("Nit 31.576.714-5"."\n");
					$printer->text("Cra 56 #17 67 Av Guadalupe"."\n");
					$printer->text("Cel:3206539522"."\n");
					$printer->text($this->fecha." ".$this->hora."\n");
					$printer->text("Atendido por: ".$this->mesero."- Mesa: ".$this->mesa."\n");
					$salto_de_linea= "\n";
					if($this->cliente != "0"){
						$printer->text("Cliente: ".$this->cliente."\n");
					}
					if($this->documento != "0"){
						$printer->text("Nit/CC: ".$this->documento.$salto_de_linea."\n");
					}
					$printer->text("Factura No.".$this->id." Pago:".$this->metodo."\n");
					$printer->text("-------------------------------\n");
					$printer->setJustification(Printer::JUSTIFY_LEFT);
					$printer->text("CANT    ITEM     PRECIO   TOTAL\n");
					$printer->text("-------------------------------\n");

					for($i=0;count($pedido->productos)>$i;$i++){
						$printer->setJustification(Printer::JUSTIFY_LEFT);
						$printer->text(" ".$pedido->productos[$i]->cantidad." - ".$pedido->productos[$i]->nombre."\n");
						$printer->setJustification(Printer::JUSTIFY_RIGHT);
						$printer->text("             $".number_format($pedido->productos[$i]->v_unidad)." - $".number_format($pedido->productos[$i]->v_total)."\n");
					}

					$printer->setJustification(Printer::JUSTIFY_LEFT);
					$printer->text("-------------------------------"."\n");
					$printer->setJustification(Printer::JUSTIFY_LEFT);
					$printer->text("SUBTOTAL: $".number_format($this->subtotal_p)."\n");
					$printer->text("DESCUENTO: $".number_format($this->descuento)."\n");
					$printer->setTextSize(5,5);
					$printer->text("TOTAL: $".number_format($this->total_p)."\n");
					$printer->text("-------------------------------"."\n");
					$printer->text("PAGA CON: $".number_format($this->pagadocon)."\n");
					$printer->text("CAMBIO: $".number_format($this->devuelve)."\n");
					$printer->setTextSize(1,1);
					$printer->feed(1);
					$printer->setJustification(Printer::JUSTIFY_CENTER);					
					$printer->text("Síguenos en Redes\n");
					try{
						$redes_img = EscposImage::load("./imgs/redeslogo-.png");
					    $printer->bitImage($redes_img);
					}catch(Exception $e){}

					$printer->feed(2);
					// $printer->setJustification(Printer::JUSTIFY_CENTER);
					$printer->text("Muchas gracias por tu compra\n");
					$printer->text("¡Esperamos verte pronto!\n");

					$printer->feed(4);
					$printer->cut();

					
					$printer->close();
					// IMPRIMIR DE TICKET
		}
	}

	$clienteNuevo = new update("pedidos_tb");
 ?>