<?php $this->load->view('elements/header'); ?>
<?php $this->load->view('elements/header_top'); ?>
    <!-- end header -->
    <div class="app-body">
        <?php $this->load->view('elements/left_sidebar_admin'); ?>
        <!-- end sidebar -->
        <main class="main">
            <!-- Breadcrumb -->
            <ol class="breadcrumb bc-colored bg-theme" id="breadcrumb">
                <li class="breadcrumb-item ">
                    Notifications
                </li>
                <li class="breadcrumb-item">
                   All Notifications
                </li>
            </ol>
            <div class="container-fluid">
                <div class="animated fadeIn">
                    <div class="row">
						<div class="col-md-4">
							<div class="card-body">
								<h4 class="text-theme">Notifications</h4>
								<p><small>Manage Notifications information.</small></p>
							</div>
						</div> 
						<div class="col-md-4 text-center">
							<div class="card-body">
							<?php if($this->session->flashdata('success')){ ?>
								<div class="alert alert-warning alert-dismissible fade show" role="alert">
									<?php echo $this->session->flashdata('success'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
                                </div>
							<?php } ?>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card-body">
								<div class="float-right">
									<button type="button" class="btn btn-primary send_noti" data-toggle="modal" data-target=".send_noti_modal" disabled>	
										<i class="fa fa-envelope"></i>
									</button>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".add-notification-modal" id="notification-add-button">	
										<i class="fa fa-plus"></i>
									</button>
									<button type="button" class="btn btn-danger delete_noti" disabled >	
										<i class="fa fa-trash"></i>
									</button>
								</div>
							</div>
						</div> 
					</div>
					<!-- <div class="row">
                        <div class="col-md-12">
                            <div class="card card-accent-theme">
                                <div class="card-body">
									<form action="<?php echo site_url('Admin/Notifications/Confirm'); ?>" method="get" class="form-horizontal">
									<input type="hidden" name="search" value="true" />
                                        <div class="form-group row">
											<div class="col-md-6">
												<label for="activity">		Activity
												</label>
												<select name="activity" id="activity" class="form-control">
													<option value="1" <?php echo $active==='1'?'selected':''; ?>>Online</option>
													<option value="0" <?php echo $active==='0'?'selected':''; ?>>Offline</option>
												</select>
                                            </div>
											<div class="col-md-6">
												<label for="country_id">		Country
												</label>
												<select name="country_id" id="country_id" class="form-control">
													<option value="0" <?php echo $active==='0'?'selected':''; ?>>Country</option>
													<?php foreach($countries as $key=>$country){ ?>
													<option value="<?php echo $country->country_id; ?>" <?php echo $country==$country->country_id?'selected':''; ?>><?php echo $country->country_name; ?></option>
													<?php } ?>
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
											<div class="col-md-6">
												<label for="state_id">		State
												</label>
												<select name="state_id" id="state_id" class="form-control">
												</select>
                                            </div>
											<div class="col-md-6">
												<label for="city_id">		City
												</label>
												<select name="city_id" id="city_id" class="form-control">
													
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <div class="col-md-6">
												<label for="f_title">Notification Title</label>
                                                <input type="text" class="form-control" name="title" id="f_title" value="<?php echo $title; ?>" placeholder="Notification Title">
                                            </div>
                                            <div class="col-md-6">
												<label for="f_status">Notification Status</label>
                                                <select name="status" id="f_status" class="form-control">
													<option value="0" <<?php echo $status==='0'?'selected':''; ?>>New</option>
													<option value="1" <<?php echo $status==='1'?'selected':''; ?>>Ready to send</option>
													<option value="2" <<?php echo $status==='2'?'selected':''; ?>>Sending</option>
													<option value="3" <<?php echo $status==='3'?'selected':''; ?>>Finished</option>
												</select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-6">
												<label for="f_type">Notification Type</label>
                                               <select name="type" id="f_type" class="form-control">
													<option value="0">
														All
													</option>
													<?php foreach($noti_types as $key=>$noti_type) { ?>
													<option value="<?php echo $noti_type->id; ?>" <?php echo $type==$noti_type->id?'selected':''; ?>><?php echo $noti_type->title; ?></option>
													<?php } ?>
												</select>
                                            </div>
                                            <div class="col-md-6">
												<label for="f_added_date">Date Added</label>
												<div class="input-group date datepicker" >
                                                    <input type="text" class="form-control" name="added_date" id="f_added_date" placeholder="Date Added" value="<?php echo $added_date; ?>" >
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <div class="col-md-6">
												<label for="f_gender">Gender</label>
                                               <select name="gender" id="f_gender" class="form-control">
													<option value="male" >Male
													</option>
													<option value="female" >Female
													</option>
												</select>
                                            </div>
                                            <div class="col-md-6">
												<label for="f_lgbtq">LGBTQ</label>
												<select name="lgbtq" id="f_lgbtq" class="form-control">
													<option value="yes" >Yes
													</option>
													<option value="no" >No
													</option>
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <div class="col-md-4">
												<label for="f_birth_year_from">Birth Year From</label>
                                               <input type="text" name="birth_year_from" id="f_birth_year_from"  class="form-control" />
                                            </div>
                                            <div class="col-md-4">
												<label for="f_birth_year_to">Birth Year To</label>
												<input type="text" name="birth_year_to" id="f_birth_year_to" class="form-control" />
                                            </div>
											<div class="col-md-4">
												<label for="f_users">Users</label>
												<select name="user_ids[]" id="f_users" class="form-control" multiple >
												
												<?php foreach($users as $key=>$user){ ?>	<option value="<?php echo $user->id; ?>">
													<?php echo $user->first_name.' '.$user->last_name; ?>(<?php echo $user->id; ?>)
												</option>
												<?php } ?>
												</select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12 text-right">
                                                <button type="submit" class="btn btn-primary">
													<i class="fa fa-search"></i>Filter
												</button>
                                            </div>
                                        </div>
                                    </form>
								</div>
							</div>
						</div>
					</div> -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-accent-theme">
                                <div class="card-body">
                                    <table class="table table-hover table-striped w-full" id="noti_table" width="100%">
                                        <thead>
											<tr>
                                                <th><input id="all" type="checkbox" class="form-control selected_id" name="selected_id1" ></th>
                                                <th>ID</th>
                                                <th>Type</th>
                                                <th>Title</th>
                                                <th>Content</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?php if(!empty($notifications)){ 
											foreach($notifications as $key=>$notification){ 
											?>
											<tr>
												<td><input type="checkbox" class="form-control checkboxclass" name="selected_id" value="<?php echo $notification->id; ?>" ></td>
                                                <td><?php echo $notification->id; ?></td>
                                                <td><?php echo $notification->type_title; ?></td>
                                                <td style="width: 250px;word-break: break-all;"><?php echo $notification->title; ?></td>
                                                <td style="width: 250px;word-break: break-all;"><?php echo $notification->content; ?></td>
                                                <td><?php echo $notification->created_date; ?></td>
                                                <td><?php echo $status_arr[$notification->status]; ?></td>
                                                <td>
													<!-- <a class="btn btn-primary openEditModel" href="javascript:void(0)" style="margin: 0px; padding: 5px 10px;" noti_id = <?php echo $notification->id; ?>><i class="fa fa-pencil"></i></a>
													<a class="btn btn-danger openEditModel" href="javascript:void(0)" style="margin: 0px; padding: 5px 10px;" noti_id = <?php echo $notification->id; ?>><i class="fa fa-trash"></i></a> -->
												</td>
                                            </tr>
											<?php } } ?>
										</tbody>
                                    </table>
                                </div>
                                <!-- end card-body -->
                            </div>
                            <!-- end card -->
                            <!-- end card -->
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                        <!--/.col-->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end animated fadeIn -->
            </div>
            <!-- end container-fluid -->
        </main>
        <!-- end main -->
    </div>
    <!-- end app-body -->
	<div class="modal fade add-notification-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">New Notification</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="col-sm-12">
						<form action="<?php echo site_url('Admin/Notifications'); ?>" method="post" id="notification-add-form">
							<input type="hidden" name="save_noti" value="true" />
							<div class="card">
								<div class="card-body" id="notification-content">
									<input type='hidden' name='type' value='3' />
									<div class="form-group">
										<label for="title">Title</label>
										<input type="text" class="form-control required" id="title" name="title" placeholder="Title" required maxlength='50' />
									</div>
									<div class="form-group">
										<label for="content">Content</label>
										<textarea class="form-control required" id="content" name="content" required></textarea>
									</div>
									<!-- <div class="form-group">
										<label for="status">Status</label>
										<select name="status" id="status" class="form-control">
											<?php foreach($status_arr as $key=>$status){ ?>
											<option value="<?php echo $key; ?>"><?php echo $status; ?></option>
											<?php } ?>
										</select>
									</div> -->
									<!--/.row-->
									<!-- <div class="form-group">
										<label for="added_date">Send date (Leave empty to send immediately)</label>
										<input type="text" class="form-control datepicker" id="added_date" name="added_date" placeholder="Date" />
									</div> -->
									<div class="form-group row">
										<div class="col-md-12 text-right">
											<button type="button" class="btn btn-theme btn-sm" id="notification-next-button"><i class="fa fa-dot-circle-o"></i> Next</button>
										</div>
									</div>
								</div>
								<div class="card-body" style="display:none;" id="notification-filter">
									<form action="<?php echo site_url('Admin/Notifications/Confirm'); ?>" method="get" class="form-horizontal">
									<input type="hidden" name="search" value="true" />
                                        <div class="form-group row">
											<div class="col-md-6">
												<label for="activity">Activity
												</label>
												<select name="activity" id="activity" class="form-control">
													<option value="" <?php echo $active===''?'selected':''; ?>>All</option>
													<option value="1" <?php echo $active==='1'?'selected':''; ?>>Online</option>
													<option value="2" <?php echo $active==='2'?'selected':''; ?>>Offline</option>
												</select>
                                            </div>
											<div class="col-md-6">
												<label for="country_id">Country
												</label>
												<select name="country_id" id="country_id" class="form-control">
													<option value="0" <?php echo $active==='0'?'selected':''; ?>>Country</option>
													<?php foreach($countries as $key=>$country){ ?>
													<option value="<?php echo $country->country_id; ?>" <?php echo $country==$country->country_id?'selected':''; ?>><?php echo $country->country_name; ?></option>
													<?php } ?>
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
											<div class="col-md-6">
												<label for="state_id">		State
												</label>
												<select name="state_id" id="state_id" class="form-control">
												</select>
                                            </div>
											<div class="col-md-6">
												<label for="city_id">		City
												</label>
												<select name="city_id" id="city_id" class="form-control">
													
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <div class="col-md-6">
												<label for="f_gender">Gender</label>
                                               <select name="gender" id="f_gender" class="form-control">
													<option value="" >Any
													</option>
													<option value="male" >Male
													</option>
													<option value="female" >Female
													</option>
												</select>
                                            </div>
                                            <div class="col-md-6">
												<label for="f_lgbtq">LGBTQ</label>
												<select name="lgbtq" id="f_lgbtq" class="form-control">
													<option value="" >Any
													</option>
													<option value="yes" >Yes
													</option>
													<option value="no" >No
													</option>
												</select>
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <div class="col-md-6">
												<label for="f_birth_year_from">Birth Year From</label>
                                               <input type="text" name="birth_year_from" id="f_birth_year_from"  class="form-control" />
                                            </div>
                                            <div class="col-md-6">
												<label for="f_birth_year_to">Birth Year To</label>
												<input type="text" name="birth_year_to" id="f_birth_year_to" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12 text-right">
                                                <button type="button" class="btn btn-default btn-sm" id="notification-back-1-button">
													<i class="fa fa-arrow-left"></i>Back
												</button>
                                                <button type="button" class="btn btn-primary btn-sm" id="notification-filter-button">
													<i class="fa fa-search"></i>Filter
												</button>
                                            </div>
                                        </div>
                                    </form>
								</div>
								<div class="card-body" style="display:none;" id="notification-users">
									
								</div>
								<!-- end card-body -->
							</div>
						</form>
						<!-- end card -->
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<div class="modal fade" id="empModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">Edit Notification</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<div class="modal fade send_noti_modal" id="send_noti_modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">Send Notification</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="col-sm-12">
						<div class="card">
							<div class="card-header text-theme">
								<strong>Send Notification</strong>
							</div>
							<div class="card-body">
								<div class="alert alert-success" role="alert">
									<h5 class="alert-heading">Notice!</h5>
									<p>
										Selected Notification will be send to all user in form of email.
									</p>
									<hr>
									<p class="mb-0">
										Confirm and send.
									</p>
								</div>
								<button type="button" class="btn btn-theme btn-sm send_noti_now"><i class="fa fa-dot-circle-o"></i>Send</button>
								<button type="submit" class="btn btn-theme btn-sm" data-dismiss="modal"><i class="fa fa-dot-circle-o"></i>Cancel</button>
							</div>
								<!-- end card-body -->
						</div>
						<!-- end card -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<?php $this->load->view('elements/footer'); ?>
	
	<script>
		var ajax_datatable;
	(function(window, document, $, undefined) {
		$(function() {
			ajax_datatable = $("#Ajax_DataTables").dataTable({
				"processing": true,
				"serverSide": true,
				"pageLength": 10,
				"scrollX": true,
				//"order": [[ 0, "desc" ]],
				"ajax": "<?=site_url()?>Admin/Notifications/getData",
				"columns": [
					{ "data": "id"},
					{ "data": "title"},
					{ "data": "type"},
					{ "data": "content"},
					{ "data": "status"},
					{ "data": "added_date"},
					{ "data": "action"},
				]
			});
			$('#notification-add-button').click(function () {
				$('#notification-content').show()
				$('#notification-filter,#notification-users').hide()
			})
			$('#notification-next-button').click(function () {
				if(!$('#title')[0].checkValidity()) {
					$('#title').addClass('is-invalid')
					return false
				} else {
					$('#title').removeClass('is-invalid')
				}
				if(!$('#content')[0].checkValidity()) {
					$('#content').addClass('is-invalid')
					return false
				} else {
					$('#content').removeClass('is-invalid')
				}
				$('#notification-filter').show()
				$('#notification-content,#notification-users').hide()
			})
			$('#notification-back-1-button').click(function () {
				$('#notification-content').show()
				$('#notification-filter,#notification-users').hide()
			})
			$('#notification-filter-button').click(function () {
				var query = $( "#notification-add-form" ).serialize()
				$.ajax({
					url: "<?=base_url()?>Admin/notifications/filter_user?" + query,
					success: function(data) {
						$('#notification-users').html(data)
						$('#notification-users').show()
						$('#notification-content,#notification-filter').hide()
						$('#notification-add-confirm').click(function () {
							if (!$('#notification-users .check-user:checked').length) {
								return false
							}
							$( "#notification-add-form" ).submit()
						})
						$('#notification-back-2-button').click(function () {
							$('#notification-filter').show()
							$('#notification-content,#notification-users').hide()
						})
						$('#checkAll').change(function() {
							$('#notification-users .check-user').prop('checked', $(this).is(':checked'))
						})
					}
				});
			})
		});
	})(window, document, window.jQuery);
	</script>