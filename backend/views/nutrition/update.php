<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Nutrition */

$this->title = 'Update Nutrition: ' . $model->code_food;
$this->params['breadcrumbs'][] = ['label' => 'Nutritions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->code_food, 'url' => ['view', 'id' => $model->code_food]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="nutrition-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
