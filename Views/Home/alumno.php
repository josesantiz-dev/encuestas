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
</head>
<body class="hold-transition layout-top-nav">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
            <div class="container">
                <a href="<?php echo BASE_URL; ?>" class="navbar-brand">
                    <img src="<?php echo media(); ?>/images/img/itech.png" alt="Logo ITECH" class="brand-image img-circle elevation-1" style="opacity: .9">
                    <span class="brand-text font-weight-light">Heteroevaluacion Alumno</span>
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
                    <?php 
                        if(sizeof($data['materias'])!=0){?>
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Mensaje:</strong> Esta encuesta es totalmente Anónima.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="card">
                                <h5 class="card-header">Lista de Materias</h5>
                                <div class="card-body">
                                    <h5 class="card-title">Estimado usuario:</h5>
                                    <p class="card-text">Click en encuesta, para evaluar a tus docentes.</p>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Nombre Materia</th>
                                                    <th scope="col">Opciones</th>
                                                    <th scope="col">Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $numero_materias = 0;
                                                    foreach($data['materias'] as $materia){
                                                        $numero_materias = $numero_materias+1 ;?>
                                                            <tr>
                                                                <th scope="row"><?php echo $numero_materias; ?></th>
                                                                <td><?php echo($materia['fullname_course']);?></td>
                                                                <?php
                                                                    if($data['status'][$materia['id_course']] != 0){
                                                                        ?>
                                                                            <td><a href="heteroevaluacion_alumno?id=<?php echo($materia['id_course']);?>&p=<?php echo($data['plataforma']);?>&u=<?php echo(base64_encode($data['username'])); ?>" class="btn btn-default disabled" target="_blank">   Encuesta   </a></td>
                                                                        <?php

                                                                    }else{
                                                                        ?>
                                                                        <td><a href="heteroevaluacion_alumno?id=<?php echo($materia['id_course']);?>&p=<?php echo($data['plataforma']);?>&u=<?php echo(base64_encode($data['username'])); ?>" class="btn btn-success" target="_blank">   Encuesta   </a></td>

                                                                        <?php
                                                                    }
                                                                 ?>   

                                                                <?php
                                                                    if($data['status'][$materia['id_course']] == 0){
                                                                        ?>
                                                                        <td><a  class="badge badge-danger">No Contestado</a></td>
                                                                        <?php
                                                                    }else{
                                                                        ?>
                                                                        <td><a  class="badge badge-success">Contestado</a></td>
                                                                        <?php

                                                                    }
                                                                ?>
                                                                
                                                            </tr>    
                                                        <?php
                                                    }
                                                ?>
                                            </tbody>
                                        </table><br>
                                    </div> 
                                    <a href="salir" class="btn btn-primary">   Salir   </a>
                                </div>
                            </div>
                        <?php        
                        }else{?>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Mensaje:</strong> No cuentas con materias activas en Plataforma como Alumno.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <a href="salir" class="btn btn-primary">   Salir   </a>
                        <?php
                        }
                    ?>
                </div>
            </div>
        </div>
<?php footerAdmin($data); ?>