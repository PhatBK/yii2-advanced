<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Foods]].
 *
 * @see Foods
 */
class FoodsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Foods[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Foods|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
