<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Nutrition */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nutrition-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'code_food')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'protein')->textInput() ?>

    <?= $form->field($model, 'fast')->textInput() ?>

    <?= $form->field($model, 'carbon')->textInput() ?>

    <?= $form->field($model, 'fiber')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
