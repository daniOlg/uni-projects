<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase

class ServicesController {
    private $services;

    public function __construct() {
        $this->services = [];
    }

    public function getAllServices() {
        $connection = new Connection();
        $sql = "SELECT s.id, ti.esp AS title_esp, ti.eng AS title_eng, te.esp AS text_esp, te.eng AS text_eng, s.activo 
            FROM services s JOIN titles ti ON s.text_id = ti.id JOIN texts te ON s.text_id = te.id";
        $rs = mysqli_query($connection->getConnection(), $sql);
        if ($rs) {
            while ($service = mysqli_fetch_assoc($rs)) {
                $this->services[] = $service; // Filtrar solo activos
            }
            mysqli_free_result($rs);
        }
        $connection->closeConnection();
        return $this->services;
    }
}