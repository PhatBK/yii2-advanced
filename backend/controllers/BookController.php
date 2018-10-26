<?php

namespace backend\controllers;

use Yii;
use app\models\Book;
use app\models\BookSearch;
use app\models\Tables;
use app\models\User;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BookController implements the CRUD actions for Book model.
 */
class BookController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Book models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BookSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Book model.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Book model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Book();
        $tables = Tables::find()->asArray()->all();
        $users = User::find()->asArray()->all();

        $codeTables = [];
        $codeUsers = [];
        $time = Yii::$app->formatter->asTime('now', 'php:H:i:s');
        $date = Yii::$app->formatter->asDate('now', 'yyyy-MM-dd');
    
        foreach ($tables as $tb) {
            $codeTables[$tb['code']] = $tb['code'];
        }
        foreach ($users as $us) {
            $codeUsers[$us['id']] = $us['id'];
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->code]);
        }

        return $this->render('create', [
            'model' => $model,
            'codeTables' => $codeTables,
            'codeUsers' => $codeUsers,
            'time' => $time,
            'date' => $date,
        ]);
    }

    /**
     * Updates an existing Book model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $tables = Tables::find()->asArray()->all();
        $users = User::find()->asArray()->all();

        $codeTables = [];
        $codeUsers = [];
        $time = $model->time;
        $date = $model->date;
    
        foreach ($tables as $tb) {
            $codeTables[$tb['code']] = $tb['code'];
        }
        foreach ($users as $us) {
            $codeUsers[$us['id']] = $us['id'];
        }


        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->code]);
        }

        return $this->render('update', [
            'model' => $model,
            'codeTables' => $codeTables,
            'codeUsers' => $codeUsers,
            'time' => $time,
            'date' => $date,
        ]);
    }

    /**
     * Deletes an existing Book model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Book model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Book the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Book::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
