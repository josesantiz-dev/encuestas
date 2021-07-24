  <footer class="main-footer text-sm">
    <div class="float-right d-none d-sm-inline">
      <a href="#">Soporte | </a> Versión v1.0.0
    </div>
    <strong>Copyright &copy; 2020-<?php echo date('Y'); ?> <a href="https://seuat.mx">Encuestas - SEUAT</a>.</strong> Todos los derechos reservados.
  </footer>
</div>

    <script>
        const base_url = "<?= base_url(); ?>";
    </script>

<!-- jQuery -->
<script src="<?php echo media(); ?>/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<?php echo media(); ?>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="<?php echo media(); ?>/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo media(); ?>/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?php echo media(); ?>/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?php echo media(); ?>/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo media(); ?>/js/adminlte.js"></script>
<!-- ChartJS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
<!-- Iconos -->
<script src="<?php echo media(); ?>/js/app.js"></script>
<!-- Funciones -->
<script src="<?= media(); ?>/js/<?= $data['page_functions_js']; ?>"></script>


</body>
</html>