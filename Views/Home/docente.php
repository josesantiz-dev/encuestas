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
                    <span class="brand-text font-weight-light">Encuestas Docente</span>
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
                        <div class="text-center col-md-12"><h4><strong>Nombre: </strong><?php echo($data['datos']['nombre']." ".$data['datos']['apellidos']) ?></h4></div><br>
                    </div>
                    <div class="text-center">
                        <img src="<?php echo($data['datos']['pictureurl']) ?>"></img>
                    </div>
                    <div class="card">
                        <h5 class="card-header bg-success">AUTOEVALUACION</h5>
                        <div class="card-body">
                            <h5 class="card-title">DETECCIÓN DE NECESIDADES DE CAPACITACIÓN</h5>
                            <p class="card-text">El siguiente cuestionario tiene la finalidad de detectar las necesidades de capacitación que los
                            docentes de la Universidad IESSIC y es fundamental para que la oferta de cursos sea diseñado para cubrir las necesidades.</p>
                            <div class="text-center">
                                <a href="autoevaluacion?u=<?php echo $data['username'] ?>&id=<?php echo $data['datos']['userid'] ?>&n=<?php echo($data['datos']['nombre'].' '.$data['datos']['apellidos'])?>&idbd=<?php echo $data['id_bd_docente'][0]['id'] ?>" class="btn btn-primary">Ir a la Encuesta</a>
                            </div>    
                        </div>
                    </div>
                    
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
                </div>
            </div>
        </div>
<?php footerAdmin($data); ?>