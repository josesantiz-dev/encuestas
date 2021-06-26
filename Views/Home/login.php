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
                    <span class="brand-text font-weight-light">Encuestas</span>
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
  
                    <div class="d-flex justify-content-center h-100">
                        
			            <div class="card card-login col-md-5">
                            <div class="logo text-center p-3">
                                <img src="<?php echo media();?>/images/Logo_seuat_color.jpeg"></img>
                            </div>    
				            <div class="p-2 d-flex justify-content-center">
					            <form  action="Home/usuario" method="POST" class="col-md-10">
                                    <div class="input-group mb-3"> 
                                        <select class="custom-select" name="plataforma" id="plataforma" required style="border-radius: 10px;"> 
                                            <option value="">Selecciona Plataforma</option>
                                            <option value="tuxtla.sm">Tuxtla - Semestral</option>
                                            <option value="tuxtla.ct">Tuxtla - Cuatrimestral</option>
                                            <option value="prepaabierta">Tuxtla - Prepa Abierta</option>
                                            <option value="tapachula.sm">Tapachula - Semestral</option>
                                            <option value="tapachula.ct">Tapachula - Cuatrimestral</option>
                                            <option value="tapilula.sm">Tapilula - Semestral</option>
                                            <option value="tapilula.ct">Tapilula - Cuatrimestral</option>
                                            <option value="reforma.sm">Reforma - Semestral</option>
                                            <option value="reforma.ct">Reforma - Cuatrimestral</option>
                                            <option value="yajalon.sm">Yajalon - Semestral</option>
                                            <option value="yajalon.ct">Yajalon - Cuatrimestral</option>
                                            <option value="oaxaca.sm">Oaxaca - Semestral</option>
                                            <option value="oaxaca.ct">Oaxaca - Cuatrimestral</option>
                                            <option value="campeche.sm">Campeche - Semestral</option>
                                            <option value="campeche.ct">Campeche - Cuatrimestral</option>
                                        </select>
						            </div>
                                    <div class="input-group mb-3"> 
                                        <select class="custom-select" name="rol" id="rol" required style="border-radius: 10px;"> 
                                            <option value="">Selecciona tu Rol</option>
                                            <option value="estudiante">Estudiante</option>
                                            <option value="docente">Docente</option>
                                            <option value="egresado">Egresado</option>
                                            <option value="administrativo">Administrativo</option>

                                        </select>
						            </div>
						            <div class="input-group mb-3">
							            <div class="input-group-append">
								            <span class="input-group-text"><i class="fas fa-user"></i></span>
							            </div>
							            <input type="text" name="username" class="form-control input_user" value="" placeholder="Usuario" required>
						            </div>
						            <div class="input-group mb-2">
							            <div class="input-group-append">
								            <span class="input-group-text"><i class="fas fa-key"></i></span>
							            </div>
							            <input type="password" name="password" class="form-control input_pass" id="password" value="" placeholder="Contraseña" required>
						            </div>
						            <div class="form-group">
							            <div class="custom-control custom-checkbox">
								            <input type="checkbox" class="custom-control-input" id="customControlInline">
								            <label class="custom-control-label" for="customControlInline">Mostrar Contraseña</label>
							            </div>
						            </div>
							        <div class="d-flex justify-content-center mt-3 login_container">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block active"><i class="fa fa-sign-in-alt mr-4"></i> Entrar</button>
				                    </div>
					            </form>
				            </div>
                            <?php if($_GET['message']){
                                ?>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <strong>Alerta!</strong> <?php echo(base64_decode($_GET['message'])); ?>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <?php
                            }
                            ?>
			            </div>
		            </div>
                </div>
            </div>
        </div>
<?php footerAdmin($data); ?>