<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Nutrition;

/**
 * NutritionSearch represents the model behind the search form of `app\models\Nutrition`.
 */
class NutritionSearch extends Nutrition
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code_food'], 'safe'],
            [['protein', 'fast', 'carbon', 'fiber'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Nutrition::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'protein' => $this->protein,
            'fast' => $this->fast,
            'carbon' => $this->carbon,
            'fiber' => $this->fiber,
        ]);

        $query->andFilterWhere(['like', 'code_food', $this->code_food]);

        return $dataProvider;
    }
}
