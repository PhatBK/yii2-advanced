<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "nutrition".
 *
 * @property string $code_food
 * @property double $protein
 * @property double $fast
 * @property double $carbon
 * @property double $fiber
 *
 * @property Foods $codeFood
 */
class Nutrition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'nutrition';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code_food', 'protein', 'fast', 'carbon', 'fiber'], 'required'],
            [['protein', 'fast', 'carbon', 'fiber'], 'number'],
            [['code_food'], 'string', 'max' => 5],
            [['code_food'], 'unique'],
            [['code_food'], 'exist', 'skipOnError' => true, 'targetClass' => Foods::className(), 'targetAttribute' => ['code_food' => 'code']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'code_food' => 'Code Food',
            'protein' => 'Protein',
            'fast' => 'Fast',
            'carbon' => 'Carbon',
            'fiber' => 'Fiber',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodeFood()
    {
        return $this->hasOne(Foods::className(), ['code' => 'code_food']);
    }

    /**
     * {@inheritdoc}
     * @return NuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new NuQuery(get_called_class());
    }
}
