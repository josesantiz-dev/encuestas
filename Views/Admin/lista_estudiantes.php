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
              <a href="AgregarLibros"><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle fa-md"></i> Nuevo</button></a>
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
                                        <h3 class="card-title">Lista de Estudiantes</h3>
                                        <p class="card-text">
                                            <table id="tableRoles" class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>username</th>
                                                        <th>Nombre</th>
                                                        <th>Apellidos</th>
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