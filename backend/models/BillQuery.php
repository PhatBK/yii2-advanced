<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Bill]].
 *
 * @see Bill
 */
class BillQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return Bill[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return Bill|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
