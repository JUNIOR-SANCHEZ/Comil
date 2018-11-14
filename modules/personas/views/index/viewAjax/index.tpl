<div class="col-sm-12">
  <div class="box">
    <div class="box-header">
      <h3 class="box-title">Listado de Personas</h3>
      <div class="box-tools">
        <div class="input-group input-group-sm" style="width: 150px;">
          <input
            type="text"
            name="table_search"
            class="form-control pull-right"
            placeholder="Search"
          />

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
            <th>Cédula</th>
            <th>Estado</th>
            <th>Dirección</th>
            <th>Correo</th>
            <th>Correo Institucional</th>
            <th>Teléfono</th>
          </tr>
        </thead>
        <tbody>
          {foreach item=x from=$consulta}
          <tr>
            <td>{$x["id"]}</td>
            <td>{$x["name"]} {$x["lastname"]}</td>
            <td>{$x["card"]}</td>
            <td>
              {if $x["state"]==1}
              <label class="label label-success btn-estado">Activo</label>
              {else}
              <label class="label label-danger btn-estado">Inactivo</label>
              {/if}
            </td>
            <td>{$x["address"]}</td>
            <td>{$x["email"]}</td>
            <td>{$x["email2"]}</td>
            <td>{$x["phone"]}</td>
            <td>
              <a
                data-ruta="{$_layoutParams.root}personas/index/consultaid_ajax/{$x['id']}"
                class="btn btn-link btn-per"
                data-toggle="modal"
                data-target="#modal-mod"
              >
                <i class="fa fa-edit"></i>
              </a>
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
