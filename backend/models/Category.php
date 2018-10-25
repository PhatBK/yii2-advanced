<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property string $code
 * @property string $name
 * @property int $view
 *
 * @property Foods[] $foods
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'name', 'view'], 'required'],
            [['view'], 'integer'],
            [['code'], 'string', 'max' => 5],
            [['name'], 'string', 'max' => 250],
            [['code'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'name' => 'Name',
            'view' => 'View',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFoods()
    {
        return $this->hasMany(Foods::className(), ['code_category' => 'code']);
    }

    /**
     * {@inheritdoc}
     * @return CategoryQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryQuery(get_called_class());
    }
}
