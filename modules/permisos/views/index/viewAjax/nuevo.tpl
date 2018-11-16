<div class="col-sm-12">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Listado de Personas</h3>
            <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search" />

                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="example2" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th style="width: 20px;">Id</th>
                        <th>Nombres y Apellidos</th>
                        <th>Fecha de solicitud</th>
                        <th>Tipo de permiso</th>
                        <th>Salida</th>
                        <th>Llegada</th>
                        <th>Inputable</th>
                        <th>Motivo</th>
                    </tr>
                </thead>
                <tbody>
                    {if isset($consulta) && !empty($consulta)} {foreach item=x
                    from=$consulta}
                    <tr>
                        <td>{$x["id"]}</td>
                        <td>{$x["name"]} {$x["lastname"]}</td>
                        <td>{$x["fecha"]}</td>
                        <td>
                            {if $x["tipo"] == 'D'}
                            <p class="text-center">Día</p>
                            {else}
                            <p class="text-center">Hora</p>
                            {/if}
                        </td>
                        <td>{$x["exit"]}</td>
                        <td>{$x["arrival"]}</td>
                        <td>
                            {if $x["inputable"]==1}
                            <p class="text-center">Si</p>
                            {else}
                            <p class="text-center">No</p>
                            {/if}
                        </td>
                        <td>{$x["description"]}</td>
                        <td>
                            <a data-ruta="{$_layoutParams.root}personas/index/consultaid_ajax/{$x['id']}" class="btn btn-link btn-per" data-toggle="modal" data-target="#modal-mod">
                                <i class="fa fa-edit"></i>
                            </a>
                        </td>
                    </tr>
                    {/foreach} {else}
                    <tr>
                        <td colspan="6">
                            <h2 class="text-center">No se hay registro</h2>
                        </td>
                    </tr>
                    {/if}
                </tbody>
            </table>
        </div>
        <div class="box-footer clearfix">
            <ul class="pagination pagination-sm no-margin pull-right">
                {if isset($paginador)}{$paginador}{/if}
            </ul>
        </div>
        <!-- /.box-body -->
    </div>
</div>