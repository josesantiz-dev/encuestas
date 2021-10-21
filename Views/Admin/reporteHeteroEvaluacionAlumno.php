<?php
headerAdmin($data);
getModal('respuestasModal', $data);
?>
<div id="contentAjax">
</div>
<div class="wrapper">
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"> <?= $data['page_title'] ?>
                            <!-- <a href="AgregarLibros"><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle fa-md"></i> Nuevo</button></a>-->
                        </h1>
                    </div>
                    <!--
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><i class="fa fa-home fa-md"></i><a href="#">Home</a></li>
                            <li class="breadcrumb-item active"><a href="<?= base_url(); ?>/roles"><?= $data['page_title'] ?></a></li>
                        </ol>
                    </div>-->
                </div>
                <div class="text-center">
                    <h1><b><?php echo ($data['datos_encuesta']['nombre_encuesta']) ?></b></h1>
                    <h1><?php echo ($data['datos_encuesta']['descripcion']) ?></h1>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body row">
                                <div class="col-12 col-xl-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Lista de Docentes Evaluados</h3>
                                            <p class="card-text">
                                            <table id="tableRoles" class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Nombre</th>
                                                        <th>Materia</th>
                                                        <th>Plataforma</th>
                                                        <th>Carrera</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-xl-5">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Plataformas</h3>
                                            <p class="card-text">
                                            <table class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Plataforma</th>
                                                        <th>Numero de Materias evaluadas</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tablePlataformas">
                                                </tbody>
                                            </table>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-xl-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Grafica - Plataformas</h3>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-xl-12">
                                    <div class="card">
                                        <div class="m-auto">
                                            <div class="row">
                                                <h4>Docente:</h4>
                                                <h4 id="nombreMateria" class="ml-4"></h4>
                                            </div>
                                            <div class="row">
                                                <h4>Materia: </h4>
                                                <p id="nombreDocente" class="ml-4"></p>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col mt-0">
                                                            <h5 class="card-title">Total de Participantes</h5>
                                                        </div>
                                                        <div class="col-auto">
                                                            <div class="avatar">
                                                                <div class="avatar-title rounded-circle bg-primary-light">
                                                                    <i class="ion-ios-book" style="zoom:2.0;"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1 class="mt-1 mb-3 font-weight-bold" id="ct-libros">#</h1>
                                                    <div class="mb-0">
                                                        <!--<span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i> -3.65% </span>-->
                                                        <span class="text-muted">Alumnos le han evaluado</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row p-2">
                                            <div class="col-lg-5">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Lista de participantes anónimos.</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <p>
                                                            <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Ver participantes</a>
                                                        </p>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="collapse multi-collapse" id="multiCollapseExample1">
                                                                    <table class="table table-striped" id="datosTabla">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Nombre completo de participante</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="datos">

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Resultados</h3>
                                                    </div>
                                                    <!-- /.card-header -->
                                                    <div class="card-body">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 10px">#</th>
                                                                    <th>Calidad de desempeño en la áreas</th>
                                                                    <th>Puntuación Máxima</th>
                                                                    <th style="width: 40px">Puntos obtenidos</th>
                                                                    <th>Puntuacion Máxima</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="valoresTabla">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- /.card-body -->
                                                    <div class="card-footer clearfix" id="totalPunto">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="card card-primary card-outline" id="cardPorPlataforma" style="display:none">
                                        <div class="card-header">
                                            <h3 class="card-title">
                                                <i class="far fa-chart-bar"></i>
                                                Reporte por Plataforma
                                            </h3>
                                            <div class="card-tools">
                                                <ul class="nav nav-pills ml-auto">
                                                    <li class="nav-item">
                                                    </li>
                                                    <li>
                                                        <br>
                                                    </li>
                                                    <li class="nav-item">
                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                            <i class="fas fa-minus"></i>
                                                        </button>
                                                    </li>
                                                    <li class="nav-item">
                                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                            <i class="fas fa-times"></i>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-body" id="reportePorPlataforma" style="display: block;">                                                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php footerAdmin($data); ?>