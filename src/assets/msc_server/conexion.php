<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');

class conexion{
  protected $servername = "localhost";
  protected $username = "root";
  protected $pass = "";
  protected $bdName = "msc_app";
  public $conexion;

  public function __construct(){
    $this->conexion = new mysqli($this->servername,$this->username,$this->pass,$this->bdName);
    if($this->conexion->connect_error){
      die("the conexion failed" . $this->conexion->connect_error);
    }
  }
}

$object = new conexion();

?>
