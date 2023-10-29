#!"C:/xampp/perl/bin/perl.exe"
use strict;
use warnings;
use CGI; 
my $cgi = CGI->new;
my $tecla = $cgi->param('boton');
my $operacion = $cgi->param('resultado');
$operacion .= $tecla;
print $cgi->header('text/html');
if($tecla eq "AC"){
  $operacion = "";
}
if(substr($operacion,0,1) eq "+" || substr($operacion,0,1) eq "*" ||
  substr($operacion,0,1) eq "/" || substr($operacion,0,1) eq "%" ||
  substr($operacion,0,1) eq "." || substr($operacion,0,1) eq ")"){
  $operacion = "";
}
if($tecla eq "="){
  if(substr($operacion, length($operacion)-1) eq "+" || substr($operacion, length($operacion)-1) eq "-" ||
    substr($operacion, length($operacion)-1) eq "*" || substr($operacion, length($operacion)-1) eq "/" || 
    substr($operacion, length($operacion)-1) eq "%"){
  }
  $operacion = eval($resultado);
}
print $cgi->start_html('Calculadora');
print <<"HTML";
<!DOCTYPE HTML>
<html lang="es">
  <head>
    <title>Calculadora</title>
    <link rel="stylesheet" href="http://localhost/estilosC.css"/>
    <link rel="icon" type="image/png" href="http://localhost/calculadora.png"/>
    <meta charset="utf-8"/>
    <meta name="author" content="Victor Gonzalo Maldonado Vilca"/>
    <meta name="description" content="Calculadora personalizada"/>
    <meta name="keywords" content="calculadora, multiplicación, respuestas, suma, resta, división"/>
  </head>
  <body class="cuerpo">
    <h1 id="titulo"><em>CALCULADORA<em></h1>
    <div>
      <form method="post" action="calculadora.pl" target="_self">
        <table id="tabla">
          <tr>
            <td colspan="4">
              <input id="cuadrotext" type="text" name="resultado" placeholder="0" value="$operacion"/>
            </td>
          </tr>
          <tr>
            <td><button class="tecla" type="submit" name="boton" value="(">(</button></td>
            <td><button class="tecla" type="submit" name="boton" value=")">)</button></td>
            <td><button class="tecla" type="submit" name="boton" value="%">%</button></td>
            <td><button class="tecla" type="submit" name="boton" value="AC">AC</button></td>
          </tr>
            <td><button class="number" type="submit" name="boton" value="7">7</button></td>
            <td><button class="number" type="submit" name="boton" value="8">8</button></td>
            <td><button class="number" type="submit" name="boton" value="9">9</button></td>
            <td><button class="tecla" type="submit" name="boton" value="/">/</button></td>
          </tr>
          </tr>
            <td><button class="number" type="submit" name="boton" value="4">4</button></td>
            <td><button class="number" type="submit" name="boton" value="5">5</button></td>
            <td><button class="number" type="submit" name="boton" value="6">6</button></td>
            <td><button class="tecla" type="submit" name="boton" value="*">*</button></td>
          </tr>
          </tr>
            <td><button class="number" type="submit" name="boton" value="1">1</button></td>
            <td><button class="number" type="submit" name="boton" value="2">2</button></td>
            <td><button class="number" type="submit" name="boton" value="3">3</button></td>
            <td><button class="tecla" type="submit" name="boton" value="-">-</button></td>
          </tr>
          </tr>
            <td><button class="number" type="submit" name="boton" value="0">0</button></td>
            <td><button class="number" type="submit" name="boton" value=".">.</button></td>
            <td><button id="calcular" name="boton" type="submit" value="=">=</button></td>
            <td><button class="tecla" type="submit" name="boton" value="+">+</button></td>
          </tr>
        </table>
      </form>
    </div>
    <footer>
        <p>Victor Gonzalo Maldonado Vilca</p>
    </footer>
  </body>
</html>
HTML
print $cgi->end_html;
