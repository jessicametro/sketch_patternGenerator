<?php

require('config.php');

$images = array();
foreach(glob($IMAGES_DIRECTORY.'/*') as $filename){
	$images[] = $filename;
}

echo json_encode($images);

?>
