<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "chef".
 *
 * @property string $code
 * @property string $name
 * @property string $age
 * @property int $sex
 * @property string $experience
 *
 * @property Task[] $tasks
 */
class Chef extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'chef';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'name', 'age', 'sex', 'experience'], 'required'],
            [['age', 'sex', 'experience'], 'integer'],
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
            'age' => 'Age',
            'sex' => 'Sex',
            'experience' => 'Experience',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTasks()
    {
        return $this->hasMany(Task::className(), ['code_chef' => 'code']);
    }

    /**
     * {@inheritdoc}
     * @return ChefQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ChefQuery(get_called_class());
    }
}
