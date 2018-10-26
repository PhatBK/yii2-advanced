<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Nutrition */

$this->title = $model->code_food;
$this->params['breadcrumbs'][] = ['label' => 'Nutritions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="nutrition-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->code_food], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->code_food], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'code_food',
            'protein',
            'fast',
            'carbon',
            'fiber',
        ],
    ]) ?>

</div>
