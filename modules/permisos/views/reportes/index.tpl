<section class="content-header">
    <h1>Tipo de sangre <small>Control panel</small></h1>
    <ol class="breadcrumb">
        <li>
            <a href="{$_layoutParams.root}"><i class="fa fa-dashboard"></i> Home</a>
        </li>
        <li class="active">tipo de sangre</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#modal-ins">
                <i class="fa fa-file-pdf-o" aria-hidden="true"></i> Generar reporte
            </button>
        </div>
        <hr />
        <div id="contenedor">
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
                            <thead >
                                <tr>
                                    <th style="width: 20px;" class="text-center">Id</th>
                                    <th class="text-center">Nombres y Apellidos</th>
                                    <th class="text-center">Fecha de solicitud</th>
                                    <th class="text-center">Tipo de permiso</th>
                                    <th class="text-center">Salida</th>
                                    <th class="text-center">Llegada</th>
                                    <th class="text-center">Inputable</th>
                                    <th class="text-center">Motivo</th>
                                </tr>
                            </thead>
                            <tbody>
                                {if isset($consulta) && !empty($consulta)}
                                {foreach item=x from=$consulta}
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
                                </tr>
                                {/foreach} {else}
                                <tr>
                                    <td colspan="8">
                                        <p class="text-center">No se hay registro</p>
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
        </div>
    </div>
</section>