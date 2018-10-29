<?php
// echo APP_LOGO;
require_once(dirname(__FILE__).'/tcpdf/tcpdf.php');
class MyPDF extends TCPDF{
    public function Header() {
        $img = ROOT."public".DS."img".DS."logo.png";
        $this->Image(APP_LOGO, 15, 4, 30, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        // Logo
       $image_file = K_PATH_IMAGES.'logo_example.jpg';
       $this->Image($img, 10, 10, 75, '', 'PNG', '', '', false, 300, 'R', false, false, 0, false, false, false);
       

        $style = array('width' => 0.5, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(39, 137, 199));

        $this->Line($this->getPageWidth()-PDF_MARGIN_RIGHT, 25, PDF_MARGIN_LEFT, 25, $style);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}