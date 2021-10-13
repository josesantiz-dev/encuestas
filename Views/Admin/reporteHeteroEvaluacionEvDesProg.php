<?php
headerAdmin($data);
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
                        </h1>
                    </div>
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
                            <div class="card-body">
                                <div class="col-12 col-xl-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Lista de Alumnos</h3>
                                            <p class="card-text">
                                            <table id="tableAlumnos" class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Nombre</th>
                                                        <th>Plataforma</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="row p-2">
                                        <div class="col-lg-6">
                                                <div class="card card-primary card-outline">
                                                    <div class="card-header">
                                                        <h3 class="card-title">
                                                            <i class="far fa-chart-bar"></i>
                                                                Total de Participantes por plataforma
                                                        </h3>
                                                        <div class="card-tools">
                                                            <ul class="nav nav-pills ml-auto">
                                                            
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
                                                    <div class="card-body">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 10px">#</th>
                                                                    <th>Plataforma</th>
                                                                    <th style="width: 10px">Numero de Participantes</th>
                                                                    <th style="width: 10px">Acciones</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="valoresTabla">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="card card-primary card-outline">
                                                    <div class="card-header">
                                                        <h3 class="card-title">
                                                            <i class="far fa-chart-bar"></i>
                                                                Grafica de todos los Planteles
                                                        </h3>
                                                        <div class="card-tools">
                                                            <ul class="nav nav-pills ml-auto">
                                                                <li class="nav-item">
                                                                    <button type="button" onclick="verGrafica()" class="btn btn-primary">Ver Grafica</button>
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
                                                    <div class="card-body" id="graficacion" style="display: block;">
                                                       
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
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="nombreAlumno">Ver respuestas</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="tablaResultado">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">#</th>
                                        <th>Pregunta</th>
                                        <th style="width:20%">Respuesta</th>
                                    </tr>
                                </thead>
                                <tbody id="valoresTablaResultadosAlumno">
                                </tbody>
                            </table>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px"><i class="fas fa-asterisk"></i></th>
                                        <th>Preguntas Abiertas</th>
                                    </tr>
                                </thead>
                                    <tbody id="valoresTablaResultadosAlumnoAbierta">
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<?php footerAdmin($data); ?>