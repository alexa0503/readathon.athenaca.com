<?php

namespace App\Handlers;

class LfmConfigHandler extends \Unisharp\Laravelfilemanager\Handlers\ConfigHandler
{
    public function userField()
    {
        return auth('admin')->user()->id;
        return '';
        //return parent::userField();
    }
}
