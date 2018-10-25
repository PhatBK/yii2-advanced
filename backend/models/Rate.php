<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rate".
 *
 * @property string $code
 * @property int $code_user
 * @property string $code_food
 * @property string $scores
 *
 * @property Foods $codeFood
 * @property User $codeUser
 */
class Rate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rate';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_user', 'code_food', 'scores'], 'required'],
            [['code_user', 'scores'], 'integer'],
            [['code', 'code_food'], 'string', 'max' => 5],
            [['code'], 'unique'],
            [['code_food'], 'exist', 'skipOnError' => true, 'targetClass' => Foods::className(), 'targetAttribute' => ['code_food' => 'code']],
            [['code_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['code_user' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'code_user' => 'Code User',
            'code_food' => 'Code Food',
            'scores' => 'Scores',
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
     * @return \yii\db\ActiveQuery
     */
    public function getCodeUser()
    {
        return $this->hasOne(User::className(), ['id' => 'code_user']);
    }

    /**
     * {@inheritdoc}
     * @return RateQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RateQuery(get_called_class());
    }
}
