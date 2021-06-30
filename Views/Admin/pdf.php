<?php
    //$url_image = BASE_URL.'/pdf/images/constancia.jpg';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <body data-temp="<?php echo $data['folio_xml'] ?>">
    <title>Constancia de titulación</title>
    <style type="text/css">
        body {
             #background-image: url(<?php echo $url_image;  ?>);
            background-size:100%;
            background-repeat: no-repeat;
            font-family: "Source Sans Pro",-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
        }
        .col-8 {
            float: left;
            width: 66.67%;
            padding: 0px;
        }
        .col-6 {
            float: left;
            width: 50%;
            padding: 0px;
        }
        .col-3 {
            float: left;
            width: 25%;
            padding: 0px;
        }
        .col-2 {
            float: left;
            width: 16.667%;
            padding: 0px;
        }
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
        .cabecera{
            background-color: #222e3c;
            padding: 10px;
        }
        h3{
            color:white;
            margin: 0px;
        }
        .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }

    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }

    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }

    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }

    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }

    .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 45px;
        color: #333;
    }

    .invoice-box table tr.information table td {
        padding-bottom: 10px;
        font-size: 12px;
    }

    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }

    .invoice-box table tr.details td {
        padding-bottom: 1px;
        font-size: 12px;
    }

    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
        font-size: 12px;
    }

    .invoice-box table tr.item.last td {
        border-bottom: none;
    }

    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }

    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }

        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }

    /** RTL **/
    .rtl {
        direction: rtl;
    }

    .rtl table {
        text-align: right;
    }

    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    .footer {
   position: fixed;
   left: 0;
   bottom: 0;
   color: black;
   font-size: 5px;
   width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
 overflow: hidden;;

}

    </style>
</head>
<body>

    <div class="cabecera" style="background-color: #073763">
        <div>
            <div class="row">
                <div class="logo col-2">
                    <img src="<?php echo media(); ?>/images/logo_iessic.jpg" style="max-width: 100%;">
                </div>
                <div class="logo col-6">
                    <p>INSTITUTO DE ESTUDIOS SUPERIORES</p>|
                    <p>"SOR JUANA INES DE LA CRUZ"</p>
                    <p>INCORPORADO A LA SECRETARIA DE EDUCACION</p>
                    <p>CLAVE: 07PSU0018E</p>
                </div>
                <div class="logo col-2">
                    <img src="<?php echo media(); ?>/images/capacitacion.jpg" style="max-width: 100%;">
                </div>
            </div>
        </div>
        <div></div>   
    </div>
    <!--
    <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                <b>Folio: </b>  <?php echo($data['folio']); ?>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="heading">
                <td>PROFESIONISTA</td>
                <td></td>
            </tr>
            <tr class="details">
                <td><b>Curp:</b></td>
                <td><?php echo($data['curp']); ?></td>
            </tr>
            <tr class="details">
                <td>
                    <b>Nombre:</b>
                </td>
                <td>
                    <?php echo($data['nombre']); ?>
                </td>
            </tr>
            <tr class="heading">
                <td>
                    INSTITUCIÓN
                </td>
                <td>
                </td>
            </tr>
            <tr class="item">
                <td style="width: 32%;">
                    <b>Institución:</b>
                </td>
                <td>
                    <?php echo($data['institucion']); ?>
                </td>
            </tr>
            <tr class="heading">
                <td>
                    CARRERA
                </td>
                <td>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Autorización:</b>
                </td>
                <td>
                    <?php echo($data['autorizacion']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Carrera</b>
                </td>
                <td>
                    <?php echo($data['carrera']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>RVOE</b>
                </td>
                <td>
                    <?php echo($data['rvoe']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fecha Inicio:</b>
                </td>
                <td>
                    <?php echo($data['fecha_inicio']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fecha Fin:</b>
                </td>
                <td>
                    <?php echo($data['fecha_fin']); ?>  
                </td>
            </tr>
            <tr class="heading">
                <td>
                    EXPEDICIÓN
                </td>
                <td>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fecha Examen:</b>
                </td>
                <td>
                    <?php echo($data['fecha_examen']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Entidad:</b>
                </td>
                <td>
                    <?php echo($data['entidad']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fundamento Legal:</b>
                </td>
                <td>
                    <?php echo($data['fundamento']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Modalidad de Titulación:</b>
                </td>
                <td>
                    <?php echo($data['modalidad']); ?>
                </td>
            </tr>
            <tr class="heading">
                <td>
                    ANTECEDENTES
                </td>
                <td>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Tipo de Estudio:</b>
                </td>
                <td>
                    <?php echo($data['tipo_estudio']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Institución:</b>
                </td>
                <td>
                    <?php echo($data['int_ant']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Entidad:</b>
                </td>
                <td>
                    <?php echo($data['ent_ant']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fecha Inicio:</b>
                </td>
                <td>
                    <?php echo($data['fecha_inicio_ant']); ?>
                </td>
            </tr>
            <tr class="details">
                <td>
                    <b>Fecha Fin:</b>
                </td>
                <td>
                    <?php echo($data['fecha_fin_ant']); ?>
                </td>
            </tr>
        </table>
    </div>
    <div class="footer">
        <?php $sello = $data['sello']; ?>
        <h2>Sello:</h2>
        <p><?php echo(substr($sello,0,256)) ?></p>
        <p><?php echo(substr($sello,256,strlen($sello))) ?></p>

    </div>
    -->
</html>
