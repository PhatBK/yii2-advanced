<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Category */

$this->title = 'Create Category <script>alert("Hacked")</script>';
$this->params['breadcrumbs'][] = ['label' => 'Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-create">

    <h1 style="text-align: center;"><?= Html::encode($this->title) ?></h1>
    <!-- <h1 style="text-align: center;"><?= $this->title ?></h1> -->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
