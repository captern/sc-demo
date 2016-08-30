<?php


$root = $argv[1];
if(!$root){
    $root = 'localhost:8080';
}
require_once($root . '');

$smarty = new Smarty;
$smarty->template_dir = $root . '/template';
$smarty->compile_dir = $root . '/templates_c';
$smarty->config_dir = $root . '/config';
$smarty->setPluginsDir([$root . '/plugin']);
$smarty->left_delimiter = '{%';
$smarty->right_delimiter = '%}';

$smarty->compileAllTemplates(".tpl", true);
?>