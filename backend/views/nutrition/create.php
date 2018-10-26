<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Nutrition */

$this->title = 'Create Nutrition';
$this->params['breadcrumbs'][] = ['label' => 'Nutritions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="nutrition-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
