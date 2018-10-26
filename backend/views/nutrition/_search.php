<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NutritionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nutrition-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'code_food') ?>

    <?= $form->field($model, 'protein') ?>

    <?= $form->field($model, 'fast') ?>

    <?= $form->field($model, 'carbon') ?>

    <?= $form->field($model, 'fiber') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
