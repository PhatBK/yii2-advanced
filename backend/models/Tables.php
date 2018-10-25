<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tables".
 *
 * @property string $code
 * @property string $orders
 * @property string $capacity
 *
 * @property Book[] $books
 * @property Menu[] $menus
 */
class Tables extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tables';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'orders', 'capacity'], 'required'],
            [['orders', 'capacity'], 'integer'],
            [['code'], 'string', 'max' => 5],
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
            'orders' => 'Orders',
            'capacity' => 'Capacity',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBooks()
    {
        return $this->hasMany(Book::className(), ['code_table' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['code_table' => 'code']);
    }

    /**
     * {@inheritdoc}
     * @return TablesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TablesQuery(get_called_class());
    }
}
