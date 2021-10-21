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
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class = "card-header">Resultados por Categoria
                                        </div>
                                        <div class="card-body">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-4">
                                                    <label>Selecciona una plataforma para ver el reporte</label>
                                                    <select class="custom-select" id="listPlataformas" onchange="plataformaSeleccionada(value)">
                                                        <option selected>Global</option>
                                                        <option value="tuxtla.ct">Tuxtla Cuatrimestral</option>
                                                        <option value="tuxtla.sm">Tuxtla Semestral</option>
                                                        <option value="prepaabierta">Prepa Abierta</option>
                                                        <option value="secundaria">Secundaria Abierta</option>
                                                        <option value="tapachula.sm">Tapachula Semestral</option>
                                                        <option value="tapachula.ct">Tapachula Cuatrimestral</option>
                                                        <option value="tapilua.sm">Tapilula Semestral</option>
                                                        <option value="tapilula.ct">Tapilula Cuatrimestral</option>
                                                        <option value="reforma.sm">Reforma Semestral</option>
                                                        <option value="reforma.ct">Reforma Cuatrimestral</option>
                                                        <option value="yajalon.sm">Yajalon Semestral</option>
                                                        <option value="yajalon.ct">Yajalon Cuatrimestral</option>
                                                        <option value="oaxaca.sm">Oaxaca Semestral</option>
                                                        <option value="oaxaca.ct">Oaxaca Cuatrimestral</option>
                                                        <option value="campeche.sm">Campeche Semestral</option>
                                                        <option value="campeche.ct">Campeche Cuatriemstral</option>
                                                    </select>
                                                </div>
                                                <div class="col-lg-8 text-center">
                                                    <button type="button" class="btn btn-outline-primary" onclick='fnRespuestasporPlataforma(this)'><i class="fas fa-chart-pie"></i> Ver respuestas</button>
                                                    <button type="button" class="btn btn-outline-primary" disabled><i class="fas fa-users"></i> Ver lista de Alumnos</button>
                                                    <button type="button" class="btn btn-outline-primary" disabled><i class="fas fa-user-tie"></i> Ver lista de Docentes</button>
                                                </div>
                                            </div><br>
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h3 class="card-title">Resultado Global por categoria</h3>
                                                        </div>
                                                        <div class="card-body">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10px">#</th>
                                                                        <th>Categoria</th>
                                                                        <th>Puntuación Máxima</th>
                                                                        <th style="width: 40px">Puntos obtenidos</th>
                                                                        <th>Puntuacion Máxima</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="valoresTablaGlobal">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="card-footer clearfix" id="totalPuntoGlobal">
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="col-lg-6">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h3 class="card-title">Resultado Global por categoria(Grafica)</h3>
                                                        </div>
                                                        <div class="card-body">
                                                            <div id='oilChartGlobalCategoria' width='auto' height='auto'>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
                                            <div class="row">
                                                <h4>Total de participantes: <h4 id="ct-libros"></h4></h4>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODALES -->
        <div class="modal fade" id="respuestasModal" tabindex="-1" aria-labelledby="respuestasModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Respuestas</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5 id="titulo-plataforma"></h5>
                        <div id="respuestasPorPlataformaGlobal"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCerrarModal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php footerAdmin($data); ?>