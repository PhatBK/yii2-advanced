<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "book".
 *
 * @property string $code
 * @property string $code_table
 * @property int $code_user
 * @property string $time
 * @property string $date
 *
 * @property Tables $codeTable
 * @property User $codeUser
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'book';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_table', 'code_user', 'time', 'date'], 'required'],
            [['code_user'], 'integer'],
            [['time', 'date'], 'safe'],
            [['code', 'code_table'], 'string', 'max' => 5],
            [['code'], 'unique'],
            [['code_table'], 'exist', 'skipOnError' => true, 'targetClass' => Tables::className(), 'targetAttribute' => ['code_table' => 'code']],
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
            'code_table' => 'Code Table',
            'code_user' => 'Code User',
            'time' => 'Time',
            'date' => 'Date',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodeTable()
    {
        return $this->hasOne(Tables::className(), ['code' => 'code_table']);
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
     * @return BookQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BookQuery(get_called_class());
    }
}
