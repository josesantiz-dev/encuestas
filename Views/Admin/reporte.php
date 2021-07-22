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
                        <h1 class="m-0">  <?= $data['page_title'] ?>
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
                    <h1><b><?php echo($data['datos_encuesta']['nombre_encuesta']) ?></b></h1>
                    <h1><?php echo($data['datos_encuesta']['descripcion']) ?></h1>
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
                                <div class="card">
                                    <div class="m-auto">
                                        <div class="row">
                                            <h4>Materia:</h4>
                                            <h4 id="nombreMateria" class="ml-4"></h4>
                                        </div>
                                        <div class="row">
                                            <h4>Docente: </h4>
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
                                    <div class="col-lg-12 col-12 row">
                                        <div class="col-lg-6 col-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <canvas id="myChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
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
                                                        <th>Puntuacion Máxima</th>
                                                        <th style="width: 40px">Puntos obtenidos</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody id="valoresTabla">
                                                    </tbody>
                                                  </table>
                                                </div>
                                                <!-- /.card-body -->
                                                <div class="card-footer clearfix">
        
                                                </div>
                                              </div>
                                        </div>
                                    </div>
                                </div>   
                      
                                
                            </div>
                        </div>
                    </div>

              <!-- Modal para buscar Matricula del Alumno-->
                    <div class="modal fade" id="modalAlumno" tabindex="-1" role="dialog" aria-labelledby="modalAlumnoLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalAlumnoLabel">Buscar Alumno</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input type="text" class="form-control" id="busquedaAlumno" placeholder="Nombre de la Encuesta" maxlength="100" autocomplete="off" onKeyUp="buscarAlumno();" />
                                    <br>
                                    <input type="text" class="form-control" id="busquedaAlumno" placeholder="Descripcion de la Encuesta" maxlength="100" autocomplete="off" onKeyUp="buscarAlumno();" />
                                    <br>
                                    <input type="text" class="form-control" id="busquedaAlumno" placeholder="Publico" maxlength="100" autocomplete="off" onKeyUp="buscarAlumno();" />
                                    <br>
                                    <input type="text" class="form-control" id="busquedaAlumno" placeholder="Estatus" maxlength="100" autocomplete="off" onKeyUp="buscarAlumno();" />
                                    <br>
                             
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
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