<section class="content-header">
    <h1>
        Tipo de sangre
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{$_layoutParams.root}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">tipo de sangre</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-sm-12">
            <a href="{$_layoutParams.root}personas/index/exel" class="btn btn-info">
                <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                EXEL
            </a>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-ins">
                <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                PDF
            </button>
            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#modal-ins">
                <i class="fa fa-plus" aria-hidden="true"></i>
                Nuevo Tipo
            </button>
        </div>
        <hr>
        <div id="contenedor">
            <div class="col-sm-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Listado de Personas</h3>
                        <div class="box-tools">
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
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
                                    <th>C&eacute;dula</th>
                                    <th>Direcci&oacute;n</th>
                                    <th>Correo</th>
                                    <th>Correo Institucional</th>
                                    <th>Tel&eacute;fono</th>
                                    <th>Estado</th>


                                </tr>
                            </thead>
                            <tbody>
                                {foreach item=x from=$consulta}
                                <tr>
                                    <td>{$x["id"]}</td>
                                    <td>{$x["name"]} {$x["lastname"]}</td>
                                    <td>{$x["card"]}</td>
                                    <td>{$x["address"]}</td>
                                    <td>{$x["email"]}</td>
                                    <td>{$x["email2"]}</td>
                                    <td>{$x["phone"]}</td>
                                    <td>
                                        {if $x["state"]==1}
                                        <span class="label label-success">Activo</span>
                                        {else}
                                        <span class="label label-danger">Inactivo</span>
                                        {/if}
                                    </td>
                                </tr>
                                {/foreach}
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
    <div class="modal fade" id="modal-ins">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Nuevo Estado Civil</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="form-ins" action="{$_layoutParams.root}personas/estado_civil/insertar_ajax">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Descripciรณn</label>
                                <div class="col-sm-8">
                                    <input type="text" name="txtdescripcion" class="form-control" id="txtdescripcion"
                                        placeholder="Descripcion">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times-circle-o"
                            aria-hidden="true"></i> Cerrar</button>
                    <button type="button" class="btn btn-primary" id="btn-ins"> <i class="fa fa-save"></i>
                        Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade modal-mod">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modificar Estado Civil</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="form-mod" action="{$_layoutParams.root}personas/estado_civil/modificar_ajax">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Id</label>
                                <div class="col-sm-2 pull-right">
                                    <input type="number" name="txtid" class="form-control " id="txtid-mod">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Descripci�n</label>
                                <div class="col-sm-8 ">
                                    <input type="text" name="txtdescripcion" class="form-control" id="txtdescripcion-mod"
                                        placeholder="Descripcion">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times-circle-o"
                            aria-hidden="true"></i> Cerrar</button>
                    <button type="button" class="btn btn-primary" id="btn-mod"> <i class="fa fa-save"></i>
                        Guardar</button>
                </div>
            </div>
        </div>
    </div>
</section>