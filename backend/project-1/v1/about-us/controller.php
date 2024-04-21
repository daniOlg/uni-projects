<?php
# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase

class AboutUsController {
    private $abouts;

    public function __construct() {
        $this->abouts = [];
    }

    public function getAllAbouts() {
        $connection = new Connection();
        $sql = "SELECT a.id, a.name, ti.esp AS title_esp, ti.eng AS title_eng, co.esp AS content_esp, co.eng AS content_eng
            FROM about_us a JOIN titles ti ON a.title_id = ti.id JOIN contents co ON a.content_id = co.id;";
        $rs = mysqli_query($connection->getConnection(), $sql);
        if ($rs) {
            while ($abouts = mysqli_fetch_assoc($rs)) {
                $this->abouts[] = $abouts; // Filtrar solo activos
            }
            mysqli_free_result($rs);
        }
        $connection->closeConnection();
        return $this->abouts;
    }
}