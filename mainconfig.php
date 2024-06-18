<?php
/**
 * Penulis Kode - SMM Panel script
 * Domain: http://penuliskode.com/
 * Documentation: http://penuliskode.com/smm/script/version-n1/documentation.html
 *
 */

date_default_timezone_set('Asia/Jakarta');
ini_set('memory_limit', '128M');

/* CONFIG */
$config['web'] = array(
	'maintenance' => 0, // 1 = yes, 0 = no
	'title' => 'cybersmm #1 Best smm panel indonesia',
	'meta' => array(
		'description' => 'CYBERSMM adalah website social media marketing Indonesia. Dengan bergabung bersama kami, Anda dapat menjadi penyedia Jasa Social Media. Seperti Jasa penambah Followers, Likes, Views, dll.',
		'keywords' => 'smm panel',
		'author' => 'zl'
	),
	'base_url' => 'https://cybersmm.eu.org/',
	'register_url' => 'https://cybersmm.eu.org//auth/register.php'
);

$config['register'] = array(
	'price' => array(
		'member' => 10000,
		'reseller' => 30000,
	),
	'bonus' => array(
		'member' => 5000,
		'reseller' => 10000,
	)
);

$config['db'] = array(
	'host' => 'localhost',
	'name' => 'xhostnes_cyb',
	'username' => 'xhostnes_cyb',
	'password' => 'xhostnes_cyb'
);
/* END - CONFIG */

require 'lib/db.php';
require 'lib/model.php';
require 'lib/function.php';

session_start();
$model = new Model();
