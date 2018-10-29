

<div class="content">
    <div class="box box-success">
        <div class="box-header">
            <i class="fa fa-user-o"></i>
            <h3 class="box-title">Permisos de Usuario</h3>
            <p>
                <strong>Usuario:</strong> {$info.usuario} | <strong>Role:</strong> {$info.role}
            </p>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                <form class="form-inline justify-content-center" action="{$_layoutParams.root}usuarios" method="POST"
                    role="search">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Buscar por usuario" name="share" id="search">
                            <div class="input-group-btn"><button type="submit" class="btn btn-info"><i class="fa fa-search    "></i></button></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="box-body">
            <form name="form1" method="post" action="">
                <input type="hidden" value="1" name="guardar">

                {if isset($permisos) && count($permisos)}
                <table class="table table-bordered table-striped table-condensed" style="width: 500px;">
                    {foreach from=$permisos item=pr}
                    {if $role.$pr.valor == 1}
                    {assign var='v' value='habilitado'}
                    {else}
                    {assign var='v' value='denegado'}
                    {/if}

                    <tr>
                        <td>{$usuario.$pr.permiso}</td>

                        <td>
                            <select name="perm_{$usuario.$pr.id}">
                                <option value="x" {if $usuario.$pr.heredado} selected="selected" {/if}>Heredado({$v}) </option>
                                    <option value="1" {if ($usuario.$pr.valor==1 && $usuario.$pr.heredado=='' )}
                                    selected="selected" {/if}>Habilitado </option>
                                <option value="" {if ($usuario.$pr.valor=='' && $usuario.$pr.heredado=='' )} selected="selected"
                                    {/if}>Denegado </option> </select> </td> </tr> {/foreach} </table> <p><button type="submit"
                                        value="guardar" class="btn btn-primary"><i class="icon-ok icon-white"> </i>
                                        Guardar</button></p>
                                    {/if}
            </form>
        </div>
    </div>
</div>
