<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "feedback".
 *
 * @property string $code
 * @property int $code_user
 * @property string $title
 * @property string $content
 * @property string $date
 *
 * @property User $codeUser
 */
class Feedback extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'feedback';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'code_user', 'title', 'content', 'date'], 'required'],
            [['code_user'], 'integer'],
            [['content'], 'string'],
            [['date'], 'safe'],
            [['code'], 'string', 'max' => 5],
            [['title'], 'string', 'max' => 250],
            [['code'], 'unique'],
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
            'title' => 'Title',
            'content' => 'Content',
            'date' => 'Date',
        ];
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
     * @return FeedbackQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new FeedbackQuery(get_called_class());
    }
}
