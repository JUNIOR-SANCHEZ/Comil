<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<!-- <link rel="icon" type="image/png" href="{$_layoutParams.root}public/img/images/escudo.png" /> -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>{$title|default:""}</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="{$_layoutParams.ruta_css}bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="{$_layoutParams.ruta_css}font-awesome.min.css">
	<link rel="stylesheet" href="{$_layoutParams.ruta_css}ionicons.min.css">
	<!-- Plugins css -->
	{if isset($_layoutParams.cssPlugin) && count($_layoutParams.cssPlugin)}
	{foreach item=css from=$_layoutParams.cssPlugin}
	<link href="{$css}" rel="stylesheet">
	{/foreach}
	{/if}

	<!-- Theme style -->
	<link rel="stylesheet" href="{$_layoutParams.ruta_css}AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="{$_layoutParams.ruta_css}_all-skins.min.css">

	<link rel="stylesheet" href="{$_layoutParams.ruta_css}jquery-ui.min.css">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

	<!-- RUTAS AUTOMATICAS CSS -->
	{if isset($_layoutParams.css) && count($_layoutParams.css)}
	{foreach item=css from=$_layoutParams.css}
	<link href="{$css}" rel="stylesheet">
	{/foreach}
	{/if}


	<script src="{$_layoutParams.ruta_js}jquery.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="{$_layoutParams.ruta_js}jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script src="{$_layoutParams.ruta_js}bootstrap.min.js"></script>
	<!-- Fastclik -->
	<script src="{$_layoutParams.ruta_js}fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="{$_layoutParams.ruta_js}adminlte.min.js"></script>
	<!-- Demo AdminLTE -->
	<script src="{$_layoutParams.ruta_js}demo.js"></script>
	<!-- SweetAlert -->
	<script src="{$_layoutParams.ruta_js}sweetalert2.all.js"></script>
	<script type="text/javascript">
		var _root_ = '{$_layoutParams.root}';
	</script>

	<!-- RUTAS AUTOMATICAS DE LIBRERIAS JS QUE NECESITEMOS EN LA APLICACION -->
	{if isset($_layoutParams.jsPlugin) && count($_layoutParams.jsPlugin)}
	{foreach item=js from=$_layoutParams.jsPlugin}
	<script src="{$js}" type="text/javascript"></script>
	{/foreach}
	{/if}




</head>

<body class="hold-transition skin-blue sidebar-collapse sidebar-mini">
	<div class="wrapper">
		{if isset($widgets.top)} {foreach item=tp from=$widgets.top} {$tp} {/foreach} {/if}

		{if isset($widgets.sidenav)} {foreach item=tp from=$widgets.sidenav} {$tp} {/foreach} {/if}

		<div class="content-wrapper">
			{include file=$_contenido}
		</div>

		{if isset($widgets.footer)} {foreach item=tp from=$widgets.footer } {$tp} {/foreach} {/if}

		<aside class="control-sidebar control-sidebar-dark">
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:void(0)">
								<i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<i class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

									<p>nora@example.com</p>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<i class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
							</a>
						</li>
					</ul>
					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design
									<span class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume
									<span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success" style="width: 95%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration
									<span class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning" style="width: 50%"></div>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework
									<span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary" style="width: 68%"></div>
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>
								Some information about this general settings option
							</p>
						</div>
						<div class="form-group">
							<label class="control-sidebar-subheading">
								Allow mail redirect
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>
								Other sets of options are available
							</p>
						</div>
						<div class="form-group">
							<label class="control-sidebar-subheading">
								Expose author name in posts
								<input type="checkbox" class="pull-right" checked>
							</label>
							<p>
								Allow the user to show his name in blog posts
							</p>
						</div>
						<h3 class="control-sidebar-heading">Chat Settings</h3>
						<div class="form-group">
							<label class="control-sidebar-subheading">
								Show me as online
								<input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<div class="form-group">
							<label class="control-sidebar-subheading">
								Turn off notifications
								<input type="checkbox" class="pull-right">
							</label>
						</div>
						<div class="form-group">
							<label class="control-sidebar-subheading">
								Delete chat history
								<a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
							</label>
						</div>
					</form>
				</div>
			</div>
		</aside>
	</div>

	<!-- RUTAS AUTOMATICAS DE ARCHIVO JS CREADOS -->
	{if isset($_layoutParams.js) && count($_layoutParams.js)}
	{foreach item=js from=$_layoutParams.js}
	<script src="{$js}" type="text/javascript"></script>
	{/foreach}
	{/if}
</body>

</html>