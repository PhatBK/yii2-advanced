<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Raw;

/**
 * RawSearch represents the model behind the search form of `app\models\Raw`.
 */
class RawSearch extends Raw
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'price'], 'integer'],
            [['code_food', 'name', 'origin'], 'safe'],
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
        $query = Raw::find();

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
            'code' => $this->code,
            'price' => $this->price,
        ]);

        $query->andFilterWhere(['like', 'code_food', $this->code_food])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'origin', $this->origin]);

        return $dataProvider;
    }
}
