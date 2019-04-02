<?php 

require __DIR__ . '/escpos-php-development/autoload.php';

/* Call this file 'hello-world.php' */

use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


// $connector = new FilePrintConnector("php://stdout");
$connector = new WindowsPrintConnector("POS-58");
$printer = new Printer($connector);
$printer -> text("Hello Darling!\n");
$printer -> text("Estefania Rodriguez Luna!\n");
$printer -> text("Te!\n");
$printer -> text("Amo!\n");
$printer -> text("Mucho!\n");
$printer -> text("Bebesita linda!\n");
$printer->feed(3);
$printer -> cut();
$printer -> close();

 ?>