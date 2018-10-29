<div class="content">
    <div class="box box-success">
        <div class="box-header">
            <i class="fa fa-cogs"></i>
            <h3 class="box-title">Nuevo Permiso</h3>
        </div>
        <div class="box-body">

            <form action="" method="POST" class="form-horizontal" role="form">
                <input type="hidden" name="guardar" value="1">
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-1 control-label">Permiso:</label>
                    <div class="col-md-3">
                        <input type="text" name="permiso" class="form-control" value="{$datos.permiso|default:''}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-1 control-label">Key: </label>
                    <div class="col-md-3">
                        <input type="text" name="key" class="form-control" value="{$datos.key|default:''}">
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-md-4 ">
                        <button type="submit" class="btn btn-primary pull-right">Submit</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>