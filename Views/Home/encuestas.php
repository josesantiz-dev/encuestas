<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex,nofollow" />
    <title><?php echo $data['page_tag']; ?></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="<?= media(); ?>/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="<?= media(); ?>/css/adminlte.min.css">
    <link rel="stylesheet" href="<?php echo media(); ?>/css/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="hold-transition layout-top-nav">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
            <div class="container">
                <a href="<?php echo BASE_URL; ?>" class="navbar-brand">
                    <img src="<?php echo media(); ?>/images/img/itech.png" alt="Logo ITECH" class="brand-image img-circle elevation-1" style="opacity: .9">
                    <span class="brand-text font-weight-light">Encuestas Alumno</span>
                </a>
                <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse order-3" id="navbarCollapse"></div>
                <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                    <li class="nav-item">
                        <form class="form-inline ml-0 ml-md-3" action="<?php echo BASE_URL; ?>/Home/getFolio" method="POST">
                            <div class="input-group input-group-sm">
                            </div>
                        </form>
                    </li>
                </ul>      
            </div>
        </nav>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container">
                    <div class="row mb-2">
                        <div class="col-sm-12 text-center">
                            <h3 class="m-0 text-secondary"><?= $data['page_title'] ?> </h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container" id="container">
                    <div class="text-center">
                        <h1>Bienvenido</h1>
                    </div>
                    <div class="row">
                    <?php 
                        //var_dump($data);
                        foreach ($data['encuestas'] as $key => $value) {
                            ?>  
                                <div class="col-md-6">
                                <div class="card">
                                    <img src="<?php echo media();?>/images/quiz-head-card-<?php echo $key ?>.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <p class="card-title"><?php echo($value['nombre_encuesta']) ?></p>
                                        <b><h5 class="card-text"><?php echo($value['descripcion']) ?></h5></b>
                                        <div class="row">
                                            <div class="col-6 pt-2">
                                                <?php
                                                    if($value['estatus'] == 1){
                                                        ?>
                                                            <p><i class="fas fa-eye" style="color:black;"></i> Activo</p>

                                                        <?php
                                                    }else{
                                                        ?>
                                                            <p><i class="fas fa-eye-slash" style="color:grey;"></i> Innactivo</p>

                                                        <?php
                                                    }
                                                ?>
                                            </div>
                                            <div class="col-6 text-right">
                                                <?php
                                                    if($value['estatus'] == 1){
                                                        ?>
                                                            <a id="<?php echo(base64_encode($value['id']))?>" u="<?php echo(base64_encode($data['username'])); ?>" rl="encuesta?id=<?php echo(base64_encode($value['id']).'&u='.base64_encode($data['username']).'&p='.base64_encode($data['plataforma']))?>" class="btn btn-primary btnResponder" onclick="estatusEncuesta(this)">Responder</a>

                                                        <?php
                                                    }else{
                                                        ?>
                                                            <a href="encuesta?id=<?php echo(base64_encode($value['id']).'&u='.base64_encode($data['username']).'&p='.base64_encode($data['plataforma']))?>" class="btn btn-primary disabled">Responder</a>

                                                        <?php
                                                    }
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            <?php
                        }
                    ?>
                    </div>
                    <div>
                    <a href="salir" class="btn btn-danger">Cerrar Sesion</a>
                    </div>
                    <!--
                    <div class="card">
                        <h5 class="card-header bg-danger">HETEROEVALUACION</h5>
                        <div class="card-body">
                            <h2>DIDACTICA DE LA LECTURA COMPRENSIVA</h2 >
                            <h5 class="card-title">DESEMPEÑO DEL CURSO DE CAPACITACION</h5>
                            <p class="card-text">El siguiente cuestionario tiene la finalidad de evaluar el desempeño del curl_setopt
                            de capacitacion y actualizacion impartido a los docentes de la Universidad IESSIC.</p>
                            <div class="text-center">
                                <a href="heteroevaluacion?u=<?php echo $data['username'] ?>&id=<?php echo $data['datos']['userid'] ?>&n=<?php echo($data['datos']['nombre'].' '.$data['datos']['apellidos'])?>&idbd=<?php echo $data['id_bd_docente'][0]['id'] ?>" class="btn btn-primary">Ir a la Encuesta</a>
                            </div>    
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
<?php footerAdmin($data); ?>