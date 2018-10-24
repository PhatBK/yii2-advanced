<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Categorys';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-categorys">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        This is Category page....
    </p>

    <div class="row">
        <div class="col-lg-5">
            <?php
                echo "<pre>";
                var_dump($_SERVER);
                echo "</pre>";
            ?>
        </div>
        <div class="col-lg-5">
            <?php
                echo "<pre>";
                var_dump($_REQUEST);
                echo "</pre>";
            ?>
        </div>
    </div>
    
</div>
