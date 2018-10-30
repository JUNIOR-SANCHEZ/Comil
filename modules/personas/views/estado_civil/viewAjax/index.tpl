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
                    <th>Tipo</th>
                    <th style="width: 5px"></th>
                    <th style="width: 5px"></th>
                </tr>
                {foreach item=x from=$consulta}
                <tr>
                    <td>{$x["id"]}</td>
                    <td class="td-descripcion">{$x["description"]}</td>
                    <td>
                        <a class="btn-id btn btn-warning  btn-sm" data-id="{$x['id']}" data-toggle="modal" data-target=".modal-mod">
                            <i class="fa fa-edit"></i>

                        </a>

                    </td>
                    <td>
                        <a href="" class="btn btn-danger btn-sm">
                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                        </a>
                    </td>
                </tr>
                {/foreach}
            </table>
        </div>
    </div>
</div>