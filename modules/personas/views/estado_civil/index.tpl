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
        <div class="col-md-offset-2 col-md-8">
            <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#modal-ins">
                <i class="fa fa-plus" aria-hidden="true"></i>
                Nuevo Tipo
            </button>
        </div>
        <hr>
        <div id="contenedor">
            <div class="col-md-offset-2 col-md-8">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"></h3>
                        <div class="box-tools">
                            <ul class="pagination pagination-sm no-margin pull-right">
                                {if isset($paginador)}{$paginador}{/if}
                            </ul>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <table class="table">
                            <tr>
                                <th style="width: 10px">#</th>
                                <th>Estado Civil</th>
                                <th style="width: 5px"></th>
                                <th style="width: 5px"></th>
                            </tr>
                            {foreach item=x from=$consulta}
                            <tr>
                                <td>{$x["id"]}</td>
                                <td class="td-descripcion">{$x["description"]}</td>
                                <td>
                                    <a class="btn-id btn btn-warning  btn-sm" data-id="{$x['id']}" data-toggle="modal"
                                        data-target=".modal-mod">
                                        <i class="fa fa-edit"></i>

                                    </a>

                                </td>
                                <td>
                                    <a data-id="{$x['id']}" class="btn btn-danger btn-sm btn-del">
                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            {/foreach}
                        </table>
                    </div>
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
                                <label for="inputEmail3" class="col-sm-4 control-label">Descripción</label>
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
                                <label for="inputEmail3" class="col-sm-4 control-label">Descripci?n</label>
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