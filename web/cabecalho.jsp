<!doctype html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/academia-icone.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Equilíbrio Fitness</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

        <link href="datatables/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="datatables/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>



        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <script>
            function vCPF(cpf) {

                if ((cpf = cpf.replace(/[^\d]/g, "")).length != 11)
                    return false

                if (cpf == "00000000000")
                    return false;
                if (cpf == "11111111111")
                    return false;
                if (cpf == "22222222222")
                    return false;
                if (cpf == "33333333333")
                    return false;
                if (cpf == "44444444444")
                    return false;
                if (cpf == "55555555555")
                    return false;
                if (cpf == "66666666666")
                    return false;
                if (cpf == "77777777777")
                    return false;
                if (cpf == "88888888888")
                    return false;
                if (cpf == "99999999999")
                    return false;

                var r;
                var s = 0;

                for (i = 1; i <= 9; i++)
                    s = s + parseInt(cpf[i - 1]) * (11 - i);

                r = (s * 10) % 11;

                if ((r == 10) || (r == 11))
                    r = 0;

                if (r != parseInt(cpf[9]))
                    return false;

                s = 0;

                for (i = 1; i <= 10; i++)
                    s = s + parseInt(cpf[i - 1]) * (12 - i);

                r = (s * 10) % 11;

                if ((r == 10) || (r == 11))
                    r = 0;

                if (r != parseInt(cpf[10]))
                    return false;

                return true;
            }
            cpfCheck = function (el) {
                document.getElementById('cpfResponse').innerHTML = vCPF(el.value) ? '<span style="color:green">CPF VÁLIDO!</span>' : '<span style="color:red">CPF INVÁLIDO!!!!</span>';
                if (el.value == '')
                    document.getElementById('cpfResponse').innerHTML = '';
            }
        </script>
