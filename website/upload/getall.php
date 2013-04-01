<?php

require('config.php');

$images = array();
foreach(glob($IMAGES_DIRECTORY.'/*') as $filename){
	$images[filemtime($filename)] = $filename;
}

ksort($images);
echo json_encode(array_reverse($images));

?>
