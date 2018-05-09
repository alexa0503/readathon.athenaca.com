<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Post as PostResource;

class Page extends JsonResource
{
    protected $block_type;
    public function __construct($resource, $block_type = null){
        $this->block_type = $block_type;
        parent::__construct($resource);
    }
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $block_type = $this->block_type;
        if($block_type == null){
            $posts = PostResource::collection($this->posts);
        }
        else{
            $posts = PostResource::collection($this->getPostsByType($block_type));
        }
        return [
            'posts' => $posts,
            'title' => $this->title,
            'name' => $this->name,
            'body' => $this->body,
        ];
    }
}
