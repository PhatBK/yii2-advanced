<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Rate]].
 *
 * @see Rate
 */
class RateQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Rate[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Rate|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
