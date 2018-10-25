<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Raw]].
 *
 * @see Raw
 */
class RawQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Raw[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Raw|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
