<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Rate */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="rate-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'code_user')->textInput() ?>

    <?= $form->field($model, 'code_food')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'scores')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
