<?php

namespace App\Listeners;

use App\Events\WordsNumberUpdated;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Helpers\Helper;

class UpdateUserRank
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Event  $event
     * @return void
     */
    public function handle(WordsNumberUpdated $event)
    {
        $activity_user = $event->activity_user;
    }
}
