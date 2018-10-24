<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\helpers\ArrayHelper;
// Package for AI and ML
use Phpml\Classification\KNearestNeighbors;
use Phpml\Association\Apriori;
use Phpml\Classification\NaiveBayes;
use Phpml\Dataset\ArrayDataset;
use Phpml\Dataset\FilesDataset;
use Phpml\Dataset\Demo\GlassDataset;
use Phpml\Dataset\Demo\IrisDataset;
use Phpml\Math\Matrix;

class AiController extends Controller
{
	public static $count;
	
	public function actionShow()
	{
		$samples = [[1, 3], [1, 4], [2, 4], [3, 1], [4, 1], [4, 2]];
        $labels = ['a', 'a', 'a', 'b', 'b', 'b'];

        $classifier = new KNearestNeighbors();
        $classifier->train($samples, $labels);

        dd($classifier->predict([3, 2]));
	}
}