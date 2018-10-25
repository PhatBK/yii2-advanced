<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RawSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="raw-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'code_food') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'price') ?>

    <?= $form->field($model, 'origin') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
