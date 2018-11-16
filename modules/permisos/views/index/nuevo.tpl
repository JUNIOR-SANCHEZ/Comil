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
      <a href="{$_layoutParams.root}personas/index/exel" class="btn btn-info">
        <i class="fa fa-file-excel-o" aria-hidden="true"></i> EXEL
      </a>
      <button type="button" class="btn btn-info">
        <i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF
      </button>
      <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#modal-ins">
        <i class="fa fa-plus" aria-hidden="true"></i> Nuevo Tipo
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
    </div>
  </div>
  <div class="modal fade" id="modal-ins">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title"><strong>Registrar Permisos</strong></h4>
        </div>
        <!-- 
                  FORMULARIO DE ENVIO     
          -->
        <form class="form-horizontal" id="form-ins" action="{$_layoutParams.root}permisos/index/insertar_ajax">
          <div class="modal-body">
            <div class="box-body">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label">Persona:</label>
                <div class="col-sm-8">
                  <select name="cb_personas" class="form-control form-custom" id="cb-persona-ins">
                    <option value="0">Seleccione uno:</option>
                    {foreach item=x from=$personas}
                    <option value="{$x['id']}">
                      {$x['name']} {$x['lastname']}
                    </option>
                    {/foreach}
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">Motivo:</label>
                <div class="col-sm-8">
                  <select name="cb_motivo" class="form-control form-custom" id="cb-motivo-ins">
                    <option value="0">Seleccione uno:</option>
                    {foreach item=x from=$motivos}
                    <option value="{$x['id']}"> {$x['description']} </option>
                    {/foreach}
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-4 control-label">Fecha:</label>
                <div class="col-sm-8">
                  <input type="text" name="txtfecha" class="form-control" id="inp-fecha-ins" placeholder="Fecha" data-toggle="datepicker" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 col-sm-offset-4">
                  Dias:
                  <input type="radio" name="rd_tipo" class="minimal pull-right" style="margin-right:20px " value="D" checked />
                </label>
                <label class="col-sm-4">
                  horas:
                  <input type="radio" name="rd_tipo" class="minimal pull-right" style="margin-right:20px " value="H" />
                </label>
              </div>
              <!-- 
                IMPUT PARA REGISTRAR LA HORA
              -->
              <div id="hora">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Salida:</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control timepicker" placeholder="Salida" id="inp-salida-h-ins" />
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Llegada:</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Llegada" id="inp-llegada-h-ins" />
                  </div>
                </div>
              </div>
              <!-- 
                IMPUT PARA REGISTRAR LA HORA
              -->
              <!-- 
                IMPUT PARA REGISTRAR EL DIA
              -->
              <div id="dia">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Salida:</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Salida" id="inp-salida-d-ins" data-toggle="datepicker" />
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Llegada:</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Llegada" id="inp-llegada-d-ins" data-toggle="datepicker" />
                  </div>
                </div>
              </div>
              <!-- 
                IMPUT PARA REGISTRAR EL DIA
              -->
              <div class="form-group">
                <label for="tar-descripcion-ins" class="col-sm-4 control-label">Descripción:</label>
                <div class="col-sm-8">
                  <textarea name="txtdescripcion" id="tar-descripcion-ins" rows="5" class="form-control"></textarea>
                </div>
              </div>
              <div class="form-group">
                <label for="" class="col-sm-4 control-label">Inputable:</label>
                <label class="col-sm-4">
                  Si:
                  <input type="radio" name="rd_inputable" class="minimal pull-right" style="margin-right:20px " value="1" checked />
                </label>
                <label class="col-sm-4">
                  No:
                  <input type="radio" name="rd_inputable" class="minimal pull-right" style="margin-right:20px " value="0" />
                </label>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              <i class="fa fa-times-circle-o" aria-hidden="true"></i> Cerrar
            </button>
            <button type="submit" class="btn btn-primary" id="btn-ins">
              <i class="fa fa-save"></i> Guardar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
