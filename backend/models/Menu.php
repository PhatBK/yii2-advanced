<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property string $code
 * @property string $code_food
 * @property string $code_table
 *
 * @property Foods $codeFood
 * @property Tables $codeTable
 */
class Menu extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_food', 'code_table'], 'required'],
            [['code', 'code_food', 'code_table'], 'string', 'max' => 5],
            [['code'], 'unique'],
            [['code_food'], 'exist', 'skipOnError' => true, 'targetClass' => Foods::className(), 'targetAttribute' => ['code_food' => 'code']],
            [['code_table'], 'exist', 'skipOnError' => true, 'targetClass' => Tables::className(), 'targetAttribute' => ['code_table' => 'code']],
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
            'code_table' => 'Code Table',
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
    public function getCodeTable()
    {
        return $this->hasOne(Tables::className(), ['code' => 'code_table']);
    }

    /**
     * {@inheritdoc}
     * @return MenuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MenuQuery(get_called_class());
    }
}
