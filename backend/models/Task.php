<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "task".
 *
 * @property string $code
 * @property string $code_food
 * @property string $code_chef
 * @property string $time
 *
 * @property Chef $codeChef
 * @property Foods $codeFood
 */
class Task extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'task';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_food', 'code_chef', 'time', 'status'], 'required', 'message' => "Bạn cần nhập đầy đủ các thông tin"],
            [['time'], 'safe'],
            [['code', 'code_food', 'code_chef'], 'string', 'max' => 5],
            [['code'], 'unique'],
            [['status'], 'integer', 'min' => 0],
            [['code_chef'], 'exist', 'skipOnError' => true, 'targetClass' => Chef::className(), 'targetAttribute' => ['code_chef' => 'code']],
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
            'code_chef' => 'Code Chef',
            'time' => 'Time',
            'status' => 'Status'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodeChef()
    {
        return $this->hasOne(Chef::className(), ['code' => 'code_chef']);
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
     * @return TaskQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TaskQuery(get_called_class());
    }
}
