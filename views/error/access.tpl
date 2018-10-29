<br><br><br><br><br><br>

<h2>{$mensaje}</h2>
<p>&nbsp;</p>

<a href="{$_layoutParams.root}">Ir al inicio</a> 
<span class="">--</span>
<a href="javascript:history.back(1)">Volver a la pagina anterior</a>

{if !Session::get('autenticado')}
<a href=" {$_layoutParams.root}login" >Iniciar session</a>
{/if}

