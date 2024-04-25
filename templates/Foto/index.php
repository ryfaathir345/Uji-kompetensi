<div class="container">
    <div class="text-right mt-3 mb-3">
        <?= $this->Html->link(__('Tambah Foto Baru'), ['action' => 'add'], ['class' => 'btn btn-primary']) ?>
    </div>
    <div class="row">
        <?php foreach ($foto as $fotoItem) : ?>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <?= $this->Html->image('img/'.$fotoItem->lokasi_foto, ['class' => 'card-img-top img-thumbnail', 'alt' => $fotoItem->judul_foto]) ?>
                    <div class="card-body">
                        <h5 class="card-title"><?= h($fotoItem->judul_foto) ?></h5>
                        <p class="card-text"><?= h($fotoItem->deskripsi) ?></p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><?= __('Tanggal Unggahan: ') . h($fotoItem->tgl_unggahan->format('d-m-Y H:i:s')) ?></li>
                        <li class="list-group-item"><?= __('Album: ') ?></li>
                        <li class="list-group-item pl-4"><?= ($fotoItem->has('album') ? $this->Html->link($fotoItem->album->nama_album, ['controller' => 'Album', 'action' => 'view', $fotoItem->album->id]) : '') ?></li>
                        <li class="list-group-item"><?= __('User: ') ?></li>
                        <li class="list-group-item pl-4"><?= ($fotoItem->has('user') ? $this->Html->link($fotoItem->user->username, ['controller' => 'User', 'action' => 'view', $fotoItem->user->id]) : '') ?></li>
                    </ul>
                    <div class="card-footer">
                        <?= $this->Html->link(__('View'), ['action' => 'view', $fotoItem->id], ['class' => 'btn btn-primary']) ?>
                        <?= $this->Html->link(__('Edit'), ['action' => 'edit', $fotoItem->id], ['class' => 'btn btn-secondary']) ?>
                        <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $fotoItem->id], ['confirm' => __('Are you sure you want to delete # {0}?', $fotoItem->id), 'class' => 'btn btn-danger']) ?>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
