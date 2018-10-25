<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Tables]].
 *
 * @see Tables
 */
class TablesQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Tables[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Tables|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
