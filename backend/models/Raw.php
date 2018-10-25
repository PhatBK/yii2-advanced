<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "raw".
 *
 * @property int $code
 * @property string $code_food
 * @property string $name
 * @property string $price
 * @property string $origin
 *
 * @property Foods $codeFood
 */
class Raw extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'raw';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_food', 'name', 'price', 'origin'], 'required'],
            [['code', 'price'], 'integer'],
            [['code_food'], 'string', 'max' => 5],
            [['name', 'origin'], 'string', 'max' => 250],
            [['code'], 'unique'],
            [['code_food'], 'exist', 'skipOnError' => true, 'targetClass' => Foods::className(), 'targetAttribute' => ['code_food' => 'code']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'code_food' => 'Code Food',
            'name' => 'Name',
            'price' => 'Price',
            'origin' => 'Origin',
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
     * @return RawQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RawQuery(get_called_class());
    }
}
