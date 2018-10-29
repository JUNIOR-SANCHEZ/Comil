<div class="content">
    <div class="box box-success">
        <div class="box-header">
            <i class="fa fa-cogs"></i>
            <h3 class="box-title">Administración de permisos</h3>
        </div>
        <div class="box-body">
            {if isset($permisos) && count($permisos)}
            <table class="table table-bordered table-condensed table-striped" style="width:500px;">
                <tr>
                    <th>ID</th>
                    <th>Permiso</th>
                    <th>Llave</th>
                    <th></th>
                </tr>

                {foreach item=rl from=$permisos}

                <tr>
                    <td>{$rl.id_permiso}</td>
                    <td>{$rl.permiso}</td>
                    <td>{$rl.key}</td>
                    <td>Editar</td>
                </tr>

                {/foreach}

            </table>
            {/if}
            <br>
            <p><a href="{$_layoutParams.root}acl/nuevo_permiso" class="btn btn-primary"><i class="icon-plus-sign icon-white">
                    </i> Agregar Permiso</a></p>
        </div>
    </div>
</div>