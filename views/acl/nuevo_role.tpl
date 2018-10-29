<style type="text/css">
    table.table td {
        vertical-align: middle;
    }

    table.table td input {
        margin: 0;
    }
</style>

<h2></h2>

<div class="content">
    <div class="box box-success">
        <div class="box-header">
            <i class="fa fa-cogs"></i>
            <h3 class="box-title">Nuevo Role</h3>
        </div>
        <div class="box-body">
            <form action="" name="form1" method="POST" class="form-horizontal" role="form">
                <input type="hidden" value="1" name="guardar">
                <div class="form-group">
                    <label for="inputEmail3" class="col-md-1 control-label ">Role:</label>
                    <div class="col-md-3">
                        <input type="text" name="role" class="form-control" value="{$datos.role|default:''}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary pull-right">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>