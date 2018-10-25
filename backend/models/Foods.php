<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "foods".
 *
 * @property string $code
 * @property string $code_category
 * @property string $name
 *
 * @property Bill[] $bills
 * @property Category $codeCategory
 * @property Menu[] $menus
 * @property Rate[] $rates
 * @property Raw[] $raws
 * @property Task[] $tasks
 * @property Video[] $videos
 */
class Foods extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'foods';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_category', 'name'], 'required'],
            [['code', 'code_category'], 'string', 'max' => 5],
            [['name'], 'string', 'max' => 250],
            [['code'], 'unique'],
            [['code_category'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['code_category' => 'code']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'code_category' => 'Code Category',
            'name' => 'Name',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBills()
    {
        return $this->hasMany(Bill::className(), ['code_food' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodeCategory()
    {
        return $this->hasOne(Category::className(), ['code' => 'code_category']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['code_food' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRates()
    {
        return $this->hasMany(Rate::className(), ['code_food' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRaws()
    {
        return $this->hasMany(Raw::className(), ['code_food' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTasks()
    {
        return $this->hasMany(Task::className(), ['code_food' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVideos()
    {
        return $this->hasMany(Video::className(), ['code_food' => 'code']);
    }

    /**
     * {@inheritdoc}
     * @return FoodsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new FoodsQuery(get_called_class());
    }
}
