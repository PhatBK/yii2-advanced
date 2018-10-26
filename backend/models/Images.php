<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "images".
 *
 * @property string $code_food
 * @property string $name
 * @property string $image_link
 *
 * @property Foods $codeFood
 */
class Images extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'images';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code_food', 'name', 'image_link'], 'required'],
            [['code_food'], 'string', 'max' => 5],
            [['name', 'image_link'], 'string', 'max' => 250],
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
            'name' => 'Name',
            'image_link' => 'Image Link',
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
     * @return ImagesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ImagesQuery(get_called_class());
    }
}
