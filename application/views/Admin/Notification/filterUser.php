<table class="table table-hover table-striped w-full" width="100%">
    <thead>
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Birthyear</th>
            <th>LGBTQ</th>
            <th><input type="checkbox" id="checkAll" checked=""></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?= $user->id ?></td>
                <td><?= $user->first_name ?> <?= $user->last_name ?></td>
                <td><?= $user->gender ?></td>
                <td><?= $user->birthyear ?></td>
                <td><?= $user->lgbtq ? 'yes' : '' ?></td>
                <td><input type="checkbox" class="check-user" name="checked_user[]" value="<?= $user->id ?>" checked=""></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<div class="form-group row">
    <div class="col-md-12 text-right">
        <button type="button" class="btn btn-default btn-sm" id="notification-back-2-button">
            <i class="fa fa-arrow-left"></i>Back
        </button>
        <button type="button" class="btn btn-theme btn-sm" id="notification-add-confirm"><i class="fa fa-dot-circle-o"></i> Confirm and send</button>
    </div>
</div>
