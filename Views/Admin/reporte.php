<?php
  headerAdmin($data);
?>

<div id="contentAjax"></div>

<div class="wrapper">

  <div class="content-wrapper">
    

    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">


            <div class="card">
              <div class="text-center mt-4">
                <a href="viewpdf?id=" target=”_blank”><button class="btn btn-primary btn-sm" title="">Ver Reporte General</button></a>              
              </div>
              <div class="card-body">
                <h3 class="card-title">Lista de Materias</h3>
                <p class="card-text">
                <table id="tableAlumnos" class="table table-bordered table-striped table-sm">
                  <thead>
                  <tr>
                    <th width="7%">#</th>
                    <th width="10%">Nombre de la Materia</th>
                    <th width="10%">Plataforma</th>
                    <th width="10%">Acciones</th>
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
    </div>
  </div>
</div>

<?php footerAdmin($data); ?>