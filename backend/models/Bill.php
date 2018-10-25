<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bill".
 *
 * @property string $code
 * @property string $code_food
 * @property int $code_user
 * @property string $total
 * @property string $date
 *
 * @property Foods $codeFood
 * @property User $codeUser
 */
class Bill extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'bill';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_food', 'code_user', 'total', 'date'], 'required'],
            [['code_user', 'total'], 'integer'],
            [['date'], 'safe'],
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
            'code_food' => 'Code Food',
            'code_user' => 'Code User',
            'total' => 'Total',
            'date' => 'Date',
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
     * @return BillQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BillQuery(get_called_class());
    }
}
