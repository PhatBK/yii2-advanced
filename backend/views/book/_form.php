<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Tables;
use app\models\User;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\Book */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="book-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'code_table')->dropDownList($codeTables, ['prompt' => '-Chọn mã bàn cần đặt-']) ?>

    <?= $form->field($model, 'code_user')->dropDownList($codeUsers, ['prompt'=>'- Chọn mã user cần đặt-'])?>

    <?= $form->field($model, 'time')->textInput(['readonly' => false, 'value' => $time]) ?>

    <?= $form->field($model, 'date')->textInput(['readonly' => false, 'value' => $date]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
