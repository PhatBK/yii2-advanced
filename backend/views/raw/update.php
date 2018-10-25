<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Raw */

$this->title = 'Update Raw: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Raws', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->code]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="raw-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
