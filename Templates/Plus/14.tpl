<?php
//////////////     made by alq0rsan   /////////////////////////
if($session->access != BANNED){
    $MyGold = $database->mysql_query_adapter("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

    $MyVilId = $database->mysql_query_adapter("SELECT * FROM ".TB_PREFIX."vdata WHERE `wref`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);

    $totalT = ($T1+$T2+$T3+$T4);
    $totalR = ($uuVilid['6']+$uuVilid['7']+$uuVilid['8']+$uuVilid['10']);

    $goldlog = $database->mysql_query_adapter("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($totalT <= $totalR) {
$database->mysql_query_adapter("UPDATE ".TB_PREFIX."vdata set wood = '".$T1."' where `wref`='".$village->wid."'") or die(mysql_error());
$database->mysql_query_adapter("UPDATE ".TB_PREFIX."vdata set clay = '".$T2."' where `wref`='".$village->wid."'") or die(mysql_error());
$database->mysql_query_adapter("UPDATE ".TB_PREFIX."vdata set iron = '".$T3."' where `wref`='".$village->wid."'") or die(mysql_error());
$database->mysql_query_adapter("UPDATE ".TB_PREFIX."vdata set crop = '".$T4."' where `wref`='".$village->wid."'") or die(mysql_error());
    $database->mysql_query_adapter("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-3)." where `id`='".$session->uid."'") or die(mysql_error());
    $database->mysql_query_adapter("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'trade 1:1')") or die(mysql_error());
echo "done";
} else {
echo "failed";
    $database->mysql_query_adapter("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Failed trade 1:1')") or die(mysql_error());

}

header("Location: plus.php?id=3");
}else{
header("Location: banned.php");
}
 ?>