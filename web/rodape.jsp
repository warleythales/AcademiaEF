
<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script src="datatables/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.foundation.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.foundation.min.js" type="text/javascript"></script>
<script src="datatables/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="datatables/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.semanticui.min.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.semanticui.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.jqueryui.js" type="text/javascript"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="datatables/dataTables.jqueryui.js"></script>
<script type="text/javascript" src="datatables/dataTables.jqueryui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('#listaPerfil').DataTable({
            "language": {
                "search": "Pesquisar",
                "lengthMenu": "Exibir _MENU_ registros por página",
                "zeroRecords": "Nenhum registro encontrado",
                "info": "Exibindo página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro encontrado",
                "infoFiltered": "(filtrados de _MAX_ registros)"
            }
        });
        $('[type=search]').addClass("form-control");
    });
</script>








</html>
