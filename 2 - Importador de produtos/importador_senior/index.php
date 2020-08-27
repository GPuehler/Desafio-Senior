<?php
use Desafio\ConnectionDB;

require_once 'db_connection.php';
$db = new ConnectionDB();
$conn = $db->getConnection();

if (isset($_POST["import"])) {
    
    $fileName = $_FILES["file"]["tmp_name"];
    
    if ($_FILES["file"]["size"] > 0) {
        
        $file = fopen($fileName, "r");
        
        while (($column = fgetcsv($file, 10000, ",")) !== FALSE) {
            
            $COD_PRODUTO = "";
            if (isset($column[0])) {
                $COD_PRODUTO = mysqli_real_escape_string($conn, $column[0]);
            }
            $DESCRICAO = "";
            if (isset($column[1])) {
                $DESCRICAO = mysqli_real_escape_string($conn, $column[1]);
            }
            $PRECO = "";
            if (isset($column[2])) {
                $PRECO = mysqli_real_escape_string($conn, $column[2]);
            }
            
            $sqlInsert = "INSERT into PRODUTOS (COD_PRODUTO,DESCRICAO,PRECO)
                   values (?,?,?)";
            $paramType = "sss";
            $paramArray = array(
                $COD_PRODUTO,
                $DESCRICAO,
                $PRECO,
            );
            $insertId = $db->insert($sqlInsert, $paramType, $paramArray);
            
            if (! empty($insertId)) {
                $type = "success";
                $message = "Os produtos foram importados com sucesso! Por favor, confirme no seu banco de dados.";
            } else {
                $type = "error";
                $message = "Houve um problema na importação dos produtos.";
            }
        }
    }
}
?>


<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href=".\styles\style.css">
<script src="jquery-3.2.1.min.js"></script>
<script src=".\src\main.js"></script>
<title>Importação de produtos</title>
</head>
<body>
    <h2>Importador de produtos CSV</h2>

    <div id="response"
        class="<?php if(!empty($type)) { echo $type . " display-block"; } ?>">
        <?php if(!empty($message)) { echo $message; } ?>
        </div>
    <div class="outer-scontainer">
        <div class="row">

            <form class="form-horizontal" action="" method="post"
                name="frmCSVImport" id="frmCSVImport"
                enctype="multipart/form-data">
                <div class="input-row">
                    <label class="col-md-4 control-label">Escolha seu arquivo CSV</label>  
                    <input type="file" name="file" id="file" accept=".csv">
                    <button type="submit" id="submit" name="import" class="btn-submit">Importar</button>
                    <br />
                </div>
            </form>
        </div>
    </div>
</body>

</html>