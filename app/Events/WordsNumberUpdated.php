<?php

namespace App\Events;

use App\AcitivityUser;
use Illuminate\Queue\SerializesModels;

class WordsNumberUpdated
{
    use SerializesModels;

    public $order;

    /**
     * Create a new event instance.
     *
     * @param  \App\Order  $order
     * @return void
     */
    public function __construct(AcitivityUser $activity_user)
    {
        $this->activity_user = $activity_user;
    }
}
