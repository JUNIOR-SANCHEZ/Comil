<div class="content">
    <div class="box box-success">
        <div class="box-header">
            <i class="fa fa-user-o"></i>
            <h3 class="box-title">Usuarios</h3>
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
            {if isset($usuarios) && count($usuarios)}
            <div class="table-responsive ">
                <div class="col-md-6 ">
                    <table class="table table-bordered table-striped table-condensed">
                        <tr>
                            <th style="width: 10px">ID</th>
                            <th>Usuario</th>
                            <th>Role</th>
                            <th></th>
                            <th></th>
                        </tr>
                        {foreach from=$usuarios item=us}
                        <tr>
                            <td>{$us.id}</td>
                            <td>{$us.usuario}</td>
                            <td>{$us.role}</td>
                            <td>
                                <a href="{$_layoutParams.root}usuarios/index/permisos/{$us.id}">
                                    Permisos
                                </a>
                            </td>
                            <td>
                    
                            </td>
                        </tr>
                        {/foreach}
                    </table>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>